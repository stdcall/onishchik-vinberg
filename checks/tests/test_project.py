from pathlib import Path
import json
import re
import shutil
import subprocess
import sys
import tempfile
import unicodedata
import unittest

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'scripts'))

from build import page_label_problems  # noqa: E402
from check_links import check_hint_links  # noqa: E402
from check_indexes import index_checks  # noqa: E402
from lint_typst import (Exceptions, coverage_checks, from_roman,  # noqa: E402
                        heading_checks, label_problem,
                        literal_reference_checks, numbering_source_checks,
                        prose_view, scan, semantic_checks, view, MARKUP,
                        CITED, CODE, MATH, STRING, COMMENT, RAW)
from project import (editor_settings, settings, stage, tool_env,  # noqa: E402
                     typst_inputs)


class Corrections(unittest.TestCase):
    """corrections.json, the journal of corrections: each entry names its
    printed page and place, the printed reading, the correction, the reason
    and how it was verified. content/corrections.typ prints all but the last
    (scripts/build.py checks that every entry is printed once)."""
    FIELDS = {'id', 'printed_page', 'section', 'place', 'original',
              'corrected', 'reason', 'verified_by'}
    # The printed book: front matter III-XIX, the text pages 1-328.
    FRONT, TEXT = (3, 19), (1, 328)

    def test_entries_carry_the_required_fields(self):
        data = json.loads((ROOT / 'corrections.json').read_text())
        self.assertEqual(set(data), {'entries'})
        self.assertIsInstance(data['entries'], list)
        ids = []
        for entry in data['entries']:
            self.assertEqual(set(entry), self.FIELDS, entry.get('id'))
            for field in self.FIELDS:
                self.assertTrue(str(entry[field]).strip(), (entry['id'], field))
            self.assertNotEqual(entry['original'], entry['corrected'])
            page = entry['printed_page']
            if isinstance(page, int):
                self.assertTrue(self.TEXT[0] <= page <= self.TEXT[1],
                                entry['id'])
            else:
                self.assertRegex(page, r'^[IVXL]+$', entry['id'])
                self.assertTrue(
                    self.FRONT[0] <= from_roman(page) <= self.FRONT[1],
                    entry['id'])
            ids.append(entry['id'])
        self.assertEqual(ids, [f'C{n:03d}' for n in range(1, len(ids) + 1)],
                         'ids are C001, C002, ... in order')


class Settings(unittest.TestCase):
    def test_stage_and_editor_agree(self):
        self.assertIn(stage(), ('draft', 'final'))
        extra = editor_settings().get('tinymist.typstExtraArgs', [])
        self.assertIn('--input=stage=' + stage(), extra)


class Labels(unittest.TestCase):
    def test_semantic_labels_of_the_book(self):
        for name in ('ch:lie-groups', 'ch:reference', 'sec:tangent-algebra',
                     'ss:virtual-lie-subgroups', 'pr:quotient-map-is-open',
                     'th:levi-subalgebra-exists',
                     'th:coset-conjugacy-on-covering-space', 'lem:key-lemma',
                     'prop:rank-three-diagrams', 'cor:connected-subgroups',
                     'exc:su2-covering', 'hint:quotient-map-is-open',
                     'exm:circle-group', 'eq:number-of-roots',
                     'eq:covering-lifting-property', 'tab:exponents',
                     'fig:rank-one-two-root-systems', 'eq:e8-weights',
                     'bib:Borel1956', 'bib:Dynkin1952a', 'numbered',
                     'index-mark'):
            self.assertIsNone(label_problem(name), name)

    def test_malformed_labels(self):
        """Numbers are counted: a label that holds only a number
        (pr:1.2.16) is no name."""
        for name in ('pr:1.2.16', 'th:4.4.4-prime', 'eq:1.3.F', 'sec:1',
                     'exm:1-2-3', 'cor:5.3.2.4', 'th:Levi', 'th:levi_theorem',
                     'th:-levi', 'th:levi-', 'eq:', 'th:4.4.4′', 'bib:x',
                     'bib:34', 'bib:borel1956', 'bib:Borel56', 'def:group',
                     'l:circle', 'pg:17', 'pg:source-1'):
            self.assertIsNotNone(label_problem(name), name)


def prose_of(text):
    kinds, _ = scan(text, cited={'bib-item'})
    return prose_view(text, kinds)


def literal_rules(text, allowed=None):
    config = {'literal_references': {'f.typ': allowed or {}}}
    exceptions = Exceptions(config, 'literal_references')
    found = literal_reference_checks('f.typ', text, prose_of(text), exceptions)
    return [f['rule'] for f in found], exceptions


class Scanner(unittest.TestCase):
    def test_modes(self):
        text = 'A #idx(16) b $x_1$ "q" // note\n'
        kinds, ends = scan(text)
        self.assertEqual(kinds[0], MARKUP)
        self.assertEqual(kinds[text.index('idx')], CODE)
        self.assertEqual(kinds[text.index('16')], CODE)
        self.assertEqual(kinds[text.index('x_1')], MATH)
        self.assertEqual(kinds[text.index('"q"')], MARKUP)  # a smart quote
        self.assertEqual(kinds[text.index('note')], COMMENT)
        self.assertIn(text.index(' b'), ends)

    def test_content_blocks_are_prose_and_strings_are_code(self):
        text = '#theorem(title: [Lie])[Body $x$ #idx("Term").]\n'
        kinds, _ = scan(text)
        self.assertEqual(kinds[text.index('Lie')], MARKUP)
        self.assertEqual(kinds[text.index('Body')], MARKUP)
        self.assertEqual(kinds[text.index('Term')], STRING)

    def test_statement_lines(self):
        text = '#let summary = [\n  = Title\n  Text.\n]\n#block(summary)\n'
        kinds, _ = scan(text)
        self.assertEqual(kinds[text.index('Title')], MARKUP)
        self.assertEqual(kinds[text.index('summary)')], CODE)


class LiteralReferences(unittest.TestCase):
    def test_references_pass(self):
        rules, _ = literal_rules(
            'Problem @pr:open-map, Problems @pr:closed-subgroup and '
            '@pr:unipotent-group, Theorem @th:lie-theorem,\nformula '
            '@eq:jacobi-identity, [@bib:Borel1956], §~@sec:tangent-algebra, '
            '@ss:virtual-subgroups, @ss:orbits[°],\nChapter @ch:lie-groups, '
            'Corollary @cor:connected-subgroups of Theorem @th:lie-theorem, '
            'Example @exm:circle-group[] of @ss:lie-subgroups, $f(1)$.\n')
        self.assertEqual(rules, [])

    def test_literal_corollary(self):
        rules, _ = literal_rules('Corollary 2 of Theorem @th:lie-theorem.\n')
        self.assertEqual(rules, ['T030'])

    def test_literals_are_found(self):
        rules, _ = literal_rules(
            'Problem 12. Problems 3 and 4. Theorem 5. Exercise 1.4.4.\n'
            'By (17) and formula (1.2). See [34]. In § 3 and 2.9, cf. 6°.\n'
            'Chapter 4.\n')
        self.assertEqual(Counter_of(rules), {'T030': 5, 'T031': 2, 'T032': 1,
                                             'T033': 4})

    def test_literal_citation_names_the_key(self):
        text = 'See [34] and [16, 17], cf. [3, Ch. 1].\n'
        found = literal_reference_checks(
            'f.typ', text, prose_of(text),
            Exceptions({'literal_references': {}}, 'literal_references'))
        messages = [f['message'] for f in found]
        self.assertEqual(len(messages), 3)
        self.assertIn('[@bib:Borel1956]', messages[0])
        self.assertIn('[@bib:Serre1965, @bib:Serre1966]', messages[1])
        self.assertIn('[@bib:Bourbaki1968, ...]', messages[2])

    def test_labels_are_not_prose(self):
        rules, _ = literal_rules('$ x = y $ <eq:jacobi-identity>\n')
        self.assertEqual(rules, [])

    def test_enumerated_statements(self):
        rules, _ = literal_rules('This implies that\n\n(1) the image is open;'
                                 '\n\n(2) the fibre is closed.\n\nBy (2) and\n'
                                 '(1) we are done.\n')
        self.assertEqual(rules, ['T031', 'T031'])

    def test_source_anchor_placement(self):
        from lint_typst import pitfall_checks
        after_heading = '= Title\n\n#source(74)The objects of\n'
        splitting = 'The sentence runs\n\n#source(18)\n\nacross it.\n'
        for text, expected in ((after_heading, []), (splitting, ['T044'])):
            kinds, ends = scan(text)
            found = pitfall_checks('f.typ', text, kinds, ends)
            self.assertEqual([f['rule'] for f in found], expected)

    def test_function_calls_in_subscripts(self):
        text = '$V times.r_upright("Id") G$, $T_x(X)$, $x_alpha(t)$\n'
        from lint_typst import source_checks
        config = {'chapter_files': 'x', 'max_line_length': 80}
        found, _, _ = source_checks('f.typ', text, config, {})
        self.assertEqual([f['rule'] for f in found], ['T020', 'T020'])

    def test_other_works_are_listed_with_a_reason(self):
        text = 'By Theorem 3.2 of [@bib:Serre1965] we have\n'
        rules, _ = literal_rules(text)
        self.assertEqual(rules, ['T030'])
        rules, exceptions = literal_rules(
            text, {'Theorem 3.2 of [@bib:Serre1965]':
                   'Theorem of the cited work.'})
        self.assertEqual(rules, [])
        self.assertEqual(exceptions.unused(), [])

    def test_listed_phrase_survives_a_line_break(self):
        text = ('(see Exercise 14 to §~9 of Ch. VIII in\n'
                '  [@bib:Bourbaki1968]).\n')
        rules, exceptions = literal_rules(text, {
            'Exercise 14 to §~9 of Ch. VIII in [@bib:Bourbaki1968]':
            'Numbers in the cited work.'})
        self.assertEqual(rules, [])
        self.assertEqual(exceptions.unused(), [])

    def test_bibliography_entries_are_not_prose(self):
        rules, _ = literal_rules('#bib-item[Borel, A.: Mat. Sb. 42 (84), '
                                 'Theorem 3.] <bib:Borel1956>\n')
        self.assertEqual(rules, [])


def Counter_of(items):
    counts = {}
    for item in items:
        counts[item] = counts.get(item, 0) + 1
    return counts


def static_rules(text):
    kinds, ends = scan(text)
    found = numbering_source_checks('f.typ', text, kinds, ends)
    found += heading_checks('f.typ', text, view(text, kinds, (MARKUP, CITED)))
    return [f['rule'] for f in found]


class NumberingSource(unittest.TestCase):
    """T011, T012 (static), T017, T018: numbers are counted, labels stand at
    the objects, references are native."""

    def test_environments_with_labels_pass(self):
        text = ('== Title <sec:tangent-algebra>\n=== Sub <ss:definition>\n'
                '#theorem[Body.] <th:lie-theorem>\n#problem[Body.] '
                '<pr:open-map>\n'
                '#problem(corollary: true)[Body.] <pr:closed-map>\n'
                '#as-corollary <cor:closed-map>\n'
                '#lemma(numbered: false)[Body.]\n#corollary[Body.]\n'
                '_Examples._ #eg <exm:circle-group> One.\n'
                '#exercise[Body.] <exc:su2-covering>\n'
                '#hint[@pr:open-map][Body.]\n'
                '#hint[@pr:open-map, @pr:closed-map][Body.]\n'
                '#theorem(prime: [@th:lie-theorem])[Body.] <th:lie-prime>\n'
                '_Examples._ #eg-restart One. #eg Two.\n')
        self.assertEqual(static_rules(text), [])

    def test_missing_labels(self):
        text = ('== Title <sec:tangent-algebra>\n#theorem[Body.]\n'
                '#problem[Body.] <th:lie-theorem>\n#eg One.\n=== Sub\n')
        self.assertEqual(sorted(static_rules(text)),
                         ['T011', 'T012', 'T012', 'T012'])

    def test_written_numbers(self):
        text = ('#theorem(4)[Body.] <th:lie-theorem>\n#problem("4′")[Body.]\n'
                '#eg(3) One.\n#hint[3][Body.]\n'
                '#table-section(5)[Roots.] <tab:roots>\n*Theorem 3.* Text.\n'
                '(F1) The number of roots.\n')
        self.assertEqual(static_rules(text), ['T017'] * 8)

    def test_string_wrappers(self):
        text = ('Problem #pr(16), formula #eqref(17), [#bib("Borel1956")], '
                '#ss("1.5°").\n')
        self.assertEqual(static_rules(text), ['T018'] * 4)

    def test_labels_as_arguments(self):
        """The editor follows `@` references only: a label passed as an
        argument is reported."""
        text = ('Problems #ref(<pr:open-map>)–@pr:closed-map, '
                '#link(<pr:open-map>)[the map].\n'
                '#hint(<pr:open-map>)[Body.]\n'
                '#hint((<pr:open-map>, <pr:closed-map>))[Body.]\n'
                '#theorem(prime: <th:lie-theorem>)[Body.] <th:lie-prime>\n')
        self.assertEqual(static_rules(text), ['T018'] * 5)


class Coverage(unittest.TestCase):
    """T012 (evaluated): labels reach the numbered objects of their family;
    every numbered object is labelled; hints name existing problems."""

    @staticmethod
    def record(family, number, page, kind='numbered', **extra):
        return {'label': '<numbered>', 'position': {
            'page': page, 'x': '10pt', 'y': '10pt'},
            'value': {'kind': kind, 'family': family, 'number': number,
                      **extra}}

    def document(self, labelled, *records):
        return {'metadata': list(records), 'labelled': {
            name: {'count': 1, 'record': None if item is None else {
                'value': item['value'], 'position': item['position']}}
            for name, item in labelled.items()}}

    def test_everything_labelled(self):
        th = self.record('th', [1, 2, 1], 1)
        pr = self.record('pr', [1, 2, 1], 2)
        single = self.record('cor', None, 3)
        sec = self.record('heading', None, 4, level=2)
        hint = self.record('pr', [1, 2, 1], 5, kind='hint')
        data = self.document({'th:lie-theorem': th, 'pr:open-map': pr,
                              'sec:tangent-algebra': sec},
                             th, pr, single, sec, hint)
        self.assertEqual(coverage_checks(data, {}, True), [])

    def test_unlabelled_wrong_family_and_lost_hint(self):
        th = self.record('th', [1, 2, 1], 1)
        pr = self.record('pr', [1, 2, 1], 2)
        hint = self.record('pr', ['1', '2', '7'], 5, kind='hint')
        data = self.document({'pr:open-map': th, 'lem:key-lemma': None}, th,
                             pr, hint)
        messages = ' '.join(f['message'] for f in
                            coverage_checks(data, {}, True))
        self.assertIn('not on an object of its family', messages)
        self.assertIn('on no numbered object', messages)
        self.assertIn('pr 1.2.1 carries no label', messages)
        self.assertIn('names no existing problem', messages)

    def test_restarted_list(self):
        first = self.record('exm', [1, 1, 3, 1], 1)
        again = {'label': None, 'position': {'page': 2, 'x': '10pt',
                                             'y': '10pt'},
                 'value': {'kind': 'restart', 'family': 'exm',
                           'scope': [1, 1, 3]}}
        second = self.record('exm', [1, 1, 3, 1], 2)
        data = self.document({'exm:circle-group': first}, first, again,
                             second)
        self.assertEqual(coverage_checks(data, {}, True), [])


class PageLabels(unittest.TestCase):
    def test_well_formed(self):
        self.assertEqual(page_label_problems(['', 'i', 'ii', '1', '2', '']),
                         [])
        self.assertEqual(page_label_problems(['', '', 'v', 'vi', '1']), [])

    def test_malformed(self):
        for labels in (['1', '1'], ['i', '1', '3'], ['2', '3'], ['1', 'i'],
                       ['i', 'ii'], ['A-1']):
            self.assertTrue(page_label_problems(labels), labels)


class HintLinks(unittest.TestCase):
    """A problem's head leads to its hint and every number of the hint back
    (scripts/check_links.py on the links of the built PDF)."""

    @staticmethod
    def place(page, x, y):
        return {'page': page, 'x': f'{x}pt', 'y': f'{y}pt'}

    def links(self, *links):
        return {'links': [{'from_page': page, 'rect_top_origin':
                           [x, y - 2, x + 30, y + 10], 'to_page': to,
                           'target_top_origin': top}
                          for page, x, y, to, top in links]}

    def records(self):
        return [
            {'from': 'problem', 'number': [1, 1, 3],
             'position': self.place(5, 60, 100),
             'target-position': self.place(9, 80, 300)},
            {'from': 'hint', 'number': [1, 1, 3],
             'position': self.place(9, 80, 300),
             'target-position': self.place(5, 60, 100)},
            {'from': 'problem', 'number': [1, 1, 4],
             'position': self.place(5, 60, 200), 'target-position': None},
        ]

    def test_problem_and_hint_lead_to_each_other(self):
        links = self.links((5, 60, 100, 9, 290), (9, 80, 300, 5, 90))
        self.assertEqual(check_hint_links(links, self.records()),
                         {'problems_with_hint': 1, 'problems_without_hint': 1,
                          'hint_numbers': 1})

    def test_missing_wrong_or_stray_links_fail(self):
        for links in (
                self.links((5, 60, 100, 9, 290)),  # no way back
                self.links((5, 60, 100, 8, 290), (9, 80, 300, 5, 90)),
                self.links((5, 60, 100, 9, 290), (9, 80, 300, 5, 90),
                           (5, 60, 200, 9, 290))):  # a head without a hint
            with self.assertRaises(AssertionError):
                check_hint_links(links, self.records())


class Index(unittest.TestCase):
    @staticmethod
    def marks(*paths):
        return [{'value': {'kind': 'index-mark', 'path': list(p)}}
                for p in paths]

    def test_paths(self):
        errors, warnings = index_checks(self.marks(
            ('Element', 'nilpotent'), ('Element', 'semisimple')))
        self.assertEqual((errors, warnings), ([], []))

    def test_spelling_variants_and_empty_index(self):
        errors, _ = index_checks(self.marks(
            ('Element', 'nilpotent'), ('element', 'nilpotent')))
        self.assertEqual(len(errors), 1)
        self.assertEqual(index_checks([], final=False), (
            [], ['the index is empty: no #idx marks in the text']))
        self.assertEqual(len(index_checks([], final=True)[0]), 1)


class BibliographyLint(unittest.TestCase):
    def test_unknown_key_and_missing_number_fail_in_draft(self):
        data = {'headings': [], 'equations': [], 'metadata': [
            {'label': None, 'value': {
                'kind': 'cross-reference', 'target': 'bib:Nope2000',
                'resolved': False, 'position': {'page': 1}}},
        ]}
        found = [f for f in semantic_checks(
            data, {}, ROOT, False, {'bib:Adams1969': ('f.typ', 1)},
            {'bib:Nope2000': ('f.typ', 2), 'bib:Adams1969': ('f.typ', 3)})
            if f['rule'] == 'T016']
        self.assertEqual(len(found), 2)
        self.assertTrue(all(f['severity'] == 'error' for f in found))
        self.assertIn('Nope2000', found[0]['message'] + found[1]['message'])


class SourceAnchors(unittest.TestCase):
    """T015: the #source(N) anchors, pages of the source edition, stand once
    each and in the order of the pages."""

    @staticmethod
    def anchors(*pages):
        return {'headings': [], 'equations': [], 'metadata': [
            {'label': None, 'value': {'kind': 'source', 'file-page': page,
                                      'position': {'page': 1}}}
            for page in pages]}

    def rules(self, *pages):
        return [f['rule'] for f in semantic_checks(
            self.anchors(*pages), {}, ROOT, True, {}, {})]

    def test_ascending_pages_pass(self):
        self.assertEqual(self.rules(1, 2, 16, 17), [])

    def test_repeated_or_unordered_pages_fail(self):
        self.assertEqual(self.rules(16, 16), ['T015'])
        self.assertEqual(self.rules(17, 16), ['T015'])
        self.assertEqual(self.rules(0), ['T015'])


def braced(text, start):
    """Contents of the group opened by the bracket at `start`, and the offset
    after its closing bracket (brackets of the same kind nest)."""
    close = {'{': '}', '[': ']', '(': ')'}[text[start]]
    depth = 0
    for i in range(start, len(text)):
        if text[i] == text[start]:
            depth += 1
        elif text[i] == close:
            depth -= 1
            if depth == 0:
                return text[start + 1:i], i + 1
    raise ValueError(f'unclosed group at {start}')


def bib_database(path=ROOT / 'references.bib'):
    """BibLaTeX entries in file order: [(type, key, {field: value})]. A small
    reader for this file's form (`field = {value}`), not a general parser."""
    text = path.read_text()
    entries = []
    for m in re.finditer(r'(?m)^@(\w+)(\{)([^,\s]+),', text):
        body, _ = braced(text, m.start(2))
        fields, offset = {}, 0
        while field := re.compile(r'(\w+)\s*=\s*\{').search(body, offset):
            value, offset = braced(body, field.end() - 1)
            fields[field.group(1)] = ' '.join(value.split())
        entries.append((m.group(1), m.group(3), fields))
    return entries


def printed_list(path=ROOT / 'content/80-bibliography.typ'):
    """The printed list: [(group, key, printed text)] in the printed order;
    groups count the level-2 headings from 1."""
    text = path.read_text()
    kinds, _ = scan(text)
    text = view(text, kinds, (MARKUP, CITED, MATH, CODE, STRING, RAW))
    items, group = [], 0
    pattern = re.compile(r'#heading\(level: 2|#bib-item(?=\[)')
    for m in pattern.finditer(text):
        if m.group() != '#bib-item':
            group += 1
            continue
        body, end = braced(text, m.end())
        key = re.match(r'\s*<bib:([^>]+)>', text[end:])
        items.append((group, key.group(1) if key else None,
                      ' '.join(body.split())))
    return items


def ascii_letters(name):
    name = unicodedata.normalize('NFKD', name)
    return ''.join(c for c in name if c.isascii() and c.isalpha())


class Bibliography(unittest.TestCase):
    """references.bib (BibLaTeX) and the printed list of
    content/80-bibliography.typ hold the same works under the same keys; the
    printed number is counted, never stored."""
    KEY = re.compile(r'([A-Z][A-Za-z]*)([0-9]{4})([a-z]?)')

    @classmethod
    def setUpClass(cls):
        cls.database = bib_database()
        cls.fields = {key: fields for _, key, fields in cls.database}
        cls.items = printed_list()

    def test_database_and_printed_list_have_the_same_keys(self):
        keys = [key for _, key, _ in self.database]
        listed = [key for _, key, _ in self.items]
        self.assertEqual(len(keys), len(set(keys)), 'repeated key in .bib')
        self.assertEqual(len(listed), len(set(listed)), 'repeated #bib-item')
        self.assertEqual(len(listed), 56, 'the printed list has 56 entries')
        self.assertEqual(set(keys) - set(listed), set(), 'not in the list')
        self.assertEqual(set(listed) - set(keys), set(), 'not in .bib')

    def test_keys_are_surname_and_year(self):
        """Surname of the first author (a seminar: its name) and the first
        year of the entry; a, b, c in the order of the list only where one
        author has several entries of a year."""
        order = {key: n for n, (_, key, _) in enumerate(self.items)}
        same = {}
        for _, key, fields in self.database:
            m = self.KEY.fullmatch(key)
            self.assertIsNotNone(m, key)
            name, year, suffix = m.groups()
            first = fields['author'].split(' and ')[0]
            if first.startswith('{'):
                self.assertIn(name, ascii_letters(first), key)
            else:
                self.assertEqual(ascii_letters(first.split(',')[0]), name, key)
            self.assertEqual(fields['date'][:4], year, key)
            same.setdefault((name, year), []).append((order[key], suffix))
        for (name, year), found in same.items():
            suffixes = [suffix for _, suffix in sorted(found)]
            expected = ([''] if len(found) == 1
                        else [chr(ord('a') + i) for i in range(len(found))])
            self.assertEqual(suffixes, expected, name + year)

    def test_entries_agree_with_the_printed_text(self):
        for group, key, printed in self.items:
            fields = self.fields[key]
            self.assertEqual(fields.get('keywords'), f'group-{group}', key)
            self.assertIn(self.KEY.fullmatch(key).group(2), printed, key)
            russian = printed.endswith('(Russian)') or '(Russian). ' in printed
            self.assertEqual(fields.get('language') == 'russian', russian, key)
            for field in ('author', 'title', 'date'):
                self.assertIn(field, fields, key)

    def test_numbers_are_counted_in_the_printed_order(self):
        """The number of an entry is its place in the printed list, as the
        references of the book print it."""
        keys = ', '.join(f'"{key}"' for _, key, _ in self.items)
        expression = (
            '{ import "/content/numbering.typ": numbered-record, '
            f'record-number; ({keys},).map(key => '
            'record-number(numbered-record(label("bib:" + key)))) }')
        result = subprocess.run(
            ['typst', 'eval', *typst_inputs(ROOT), expression, '--in',
             settings()['entry'], '--format', 'json'],
            cwd=ROOT, env=tool_env(ROOT), capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(json.loads(result.stdout),
                         [[n] for n in range(1, len(self.items) + 1)])

    def test_every_citation_names_an_entry(self):
        """Static twin of lint T016: the chapter files cite the keys of the
        list, `[@bib:Borel1956]`, never printed numbers."""
        keys = {key for _, key, _ in self.items}
        lint = json.loads((ROOT / 'config/lint.json').read_text())
        chapter = re.compile(lint['chapter_files'])
        citations = 0
        for path in sorted((ROOT / 'content').glob('*.typ')):
            name = str(path.relative_to(ROOT))
            if not chapter.fullmatch(name):
                continue
            text = path.read_text()
            self.assertNotRegex(text, r'#bib\(', f'{name}: cite @bib:Key')
            cited = re.findall(r'@bib:([A-Za-z0-9]*[A-Za-z0-9])', text)
            self.assertLessEqual(set(cited), keys, name)
            citations += len(cited)
        self.assertGreater(citations, 0)

    def test_typst_reads_the_database(self):
        """The same BibLaTeX reader Typst uses for #cite (hayagriva)."""
        keys = [key for _, key, _ in self.database]
        document = ('#set page(height: auto)\n'
                    + ''.join(f'#cite(<{key}>, form: "full")\n\n'
                              for key in keys)
                    + '#bibliography("/references.bib")\n')
        with tempfile.TemporaryDirectory() as out:
            result = subprocess.run(
                ['typst', 'compile', '-', str(Path(out) / 'bib.pdf')],
                cwd=ROOT, env=tool_env(ROOT), input=document,
                capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertNotIn('warning', result.stderr)


class Insertion(unittest.TestCase):
    """A statement, a problem and a formula inserted at the start of Chapter
    1, § 1 (in a copy of the book): the following numbers of the section and
    every reference to them shift, in the section and from the rest of the
    book, and the hints follow their problems; the labels stay, and nothing
    else changes."""

    INSERTED = (
        '#problem[An inserted problem.] <pr:inserted>\n\n'
        '#theorem[An inserted theorem.] <th:inserted>\n\n'
        'An inserted formula\n$ a = b $ <eq:inserted>\n\n')
    LABELS = ('pr:inserted', 'pr:direct-product-lie-groups',
              'pr:lie-subgroup-local-criterion', 'pr:stabilizer-of-subspace',
              'th:inserted', 'th:stabilizer-is-lie-subgroup',
              'th:epimorphism-quotient-isomorphism',
              'th:preimage-of-lie-subgroup', 'eq:inserted',
              'eq:gl-action-on-multilinear-forms',
              'eq:gl-action-on-multilinear-maps')

    def evaluate(self, root):
        labels = ', '.join(f'"{label}"' for label in self.LABELS)
        # The references to numbered objects; the locators of the subject
        # index are links to pages and print no number.
        expression = (
            '{ import "/content/numbering.typ": numbered-record, '
            'record-number\n'
            f'let numbers = ({labels},).map(name => {{\n'
            '  let record = numbered-record(label(name))\n'
            '  (name, if record != none { record-number(record) })\n'
            '}).to-dict()\n'
            'let values = query(metadata).map(it => it.value).filter(v => '
            'type(v) == dictionary)\n'
            'let printed = values.filter(v => v.at("kind", default: none) '
            '== "cross-reference" and "printed" in v).map(v => (v.target, '
            'v.printed))\n'
            'let hints = values.filter(v => v.at("kind", default: none) == '
            '"hint").map(v => v.number)\n'
            '(numbers: numbers, printed: printed, hints: hints) }')
        result = subprocess.run(
            ['typst', 'eval', *typst_inputs(ROOT), expression, '--root',
             str(root), '--font-path', str(ROOT / 'assets/fonts'), '--in',
             settings()['entry'], '--format', 'json'],
            cwd=root, env=tool_env(ROOT), capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr)
        return json.loads(result.stdout)

    def test_insertion_renumbers_objects_and_references(self):
        name = '11-background.typ'
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            for part in ('content', 'assets'):
                shutil.copytree(ROOT / part, root / part)
            for bib in ROOT.glob('*.bib'):
                shutil.copy(bib, root / bib.name)
            before = self.evaluate(root)
            path = root / 'content' / name
            text = path.read_text()
            anchor = '#problem[The direct product of Lie groups'
            self.assertEqual(text.count(anchor), 1)
            # The problems, theorems and formulas of the section from the
            # place of the insertion on, and the hints to its problems.
            shifting = set(re.findall(r'<((?:pr|th|eq|hint):[\w:.-]+)>',
                                      text[text.index(anchor):]))
            path.write_text(text.replace(anchor, self.INSERTED + anchor))
            after = self.evaluate(root)
        numbers = before['numbers']
        self.assertIsNone(numbers['pr:inserted'])
        self.assertEqual(numbers['pr:direct-product-lie-groups'], [1, 1, 1])
        self.assertEqual(numbers['pr:lie-subgroup-local-criterion'],
                         [1, 1, 3])
        self.assertEqual(numbers['th:epimorphism-quotient-isomorphism'],
                         [1, 1, 5])
        self.assertEqual(numbers['eq:gl-action-on-multilinear-forms'],
                         [1, 1, 1])
        shifted = {name: None if n is None else n[:-1] + [n[-1] + 1]
                   for name, n in numbers.items()}
        for name in self.LABELS:
            if 'inserted' in name:
                continue
            self.assertEqual(after['numbers'][name], shifted[name], name)
        self.assertEqual(after['numbers']['pr:inserted'], [1, 1, 1])
        self.assertEqual(after['numbers']['th:inserted'], [1, 1, 1])
        self.assertEqual(after['numbers']['eq:inserted'], [1, 1, 1])
        # Every reference to a problem, theorem or formula of the section, or
        # to a hint of its problems, prints the new number, in the section
        # ("4"), elsewhere in Chapter 1 ("1.4") and in other chapters
        # ("1.1.4"); every other reference prints what it printed.
        old, new = before['printed'], after['printed']
        self.assertEqual([t for t, _ in new], [t for t, _ in old])
        self.assertNotIn('?', [p for _, p in old])
        components = []
        for (target, was), (_, now) in zip(old, new):
            if target not in shifting:
                self.assertEqual(now, was, target)
                continue
            head, dot, last = was.rpartition('.')
            self.assertEqual(now, head + dot + str(int(last) + 1), target)
            components.append(was.count('.') + 1)
        self.assertGreater(components.count(1), 20)
        self.assertGreater(len(components) - components.count(1), 0)
        # The hints name the problems' new numbers.
        self.assertEqual(len(after['hints']), len(before['hints']))
        moved = 0
        for was, now in zip(before['hints'], after['hints']):
            if was[:2] == [1, 1]:
                was = was[:-1] + [was[-1] + 1]
                moved += 1
            self.assertEqual(now, was)
        self.assertGreater(moved, 0)


class BookExceptions(unittest.TestCase):
    """The book's exceptions (numbering.typ) give the printed numbers of the
    accepted setting: examples through Chapter 4, § 1; no formula (10) in
    Chapter 4, § 4; the letter tag (F); Theorem 4′ from Theorem 4; the
    Reference Chapter's F-numbers; corollaries after their theorem, the
    only one unnumbered."""

    EXPECTED = {
        'exm:trace-form-and-killing-form': [4, 1, 1, 3],
        'exm:roots-of-gl-n': [4, 1, 5, 4],
        'exm:roots-of-sp': [4, 1, 5, 8],
        'exm:bases-of-rank-two-systems': [4, 2, 2, 1],
        'eq:automorphism-order-from-kac-labels': [4, 4, 9],
        'eq:affine-coxeter-relations': [4, 4, 11],
        'eq:covering-lifting-property': [1, 3, 'F'],
        'eq:homomorphism-path-equation': [1, 2, 17],
        'th:coset-conjugacy-by-normalizer': [4, 4, 4],
        'th:coset-conjugacy-on-covering-space': [4, 4, '4′'],
        'th:affine-weyl-simply-transitive': [4, 4, 5],
        'eq:number-of-roots': [7, 1, 'F1'],
        'eq:tensor-product-multiplicity': [7, 1, 'F11'],
        'eq:index-for-inner-real-form': [7, 1, 'F14'],
        'cor:cartan-identity-component': [5, 3, 2, 4],
        'cor:semisimple-group-complete-reducibility': [5, 2, 13, 2],
        'pr:semisimple-group-complete-reducibility': [5, 2, 28],
        'pr:reductive-conjugacy-general-case': [6, 1, 19],
        'ss:malcev-theorem': [6, 1, 3], 'sec:tables': [7, 2],
        'tab:centers-and-linearizers': [10],
        'fig:rank-one-two-root-systems': [1], 'fig:delta-pq-region': [2],
        'bib:Wolf1972': [56],
    }

    def test_numbers(self):
        labels = ', '.join(f'"{label}"' for label in self.EXPECTED)
        expression = (
            '{ import "/content/numbering.typ": numbered-record, '
            f'record-number; ({labels},).map(name => '
            '(name, record-number(numbered-record(label(name))))).to-dict() '
            '}')
        result = subprocess.run(
            ['typst', 'eval', *typst_inputs(ROOT), expression, '--in',
             settings()['entry'], '--format', 'json'],
            cwd=ROOT, env=tool_env(ROOT), capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(json.loads(result.stdout), self.EXPECTED)


class Tinymist(unittest.TestCase):
    """The editor goes from a reference to the label of its target in the
    assembled book (scripts/check_lsp.py)."""

    def test_definitions(self):
        if not shutil.which('tinymist'):
            self.skipTest('tinymist is not installed')
        from check_lsp import check
        check()


if __name__ == '__main__':
    unittest.main()
