import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rybbit_unofficial/features/dashboard/data/sites_repository.dart';

SitesRepository _repo() => SitesRepository(Dio());

void main() {
  group('SitesRepository.parseSitesFromOrganizations', () {
    test('returns empty list for empty organizations', () {
      final sites = _repo().parseSitesFromOrganizations([]);
      expect(sites, isEmpty);
    });

    test('returns empty list when org has no sites key', () {
      final orgs = [
        {'id': '1', 'name': 'Org One'},
      ];
      final sites = _repo().parseSitesFromOrganizations(orgs);
      expect(sites, isEmpty);
    });

    test('returns empty list when org sites array is empty', () {
      final orgs = [
        {
          'id': '1',
          'name': 'Org One',
          'sites': <dynamic>[],
        },
      ];
      final sites = _repo().parseSitesFromOrganizations(orgs);
      expect(sites, isEmpty);
    });

    test('parses site with siteId as int', () {
      final orgs = [
        {
          'id': '1',
          'name': 'Org',
          'sites': [
            {
              'id': 'abc',
              'siteId': 42,
              'name': 'My Site',
              'domain': 'example.com',
              'createdAt': '2024-01-01',
              'organizationId': '1',
              'public': false,
              'type': 'web',
            },
          ],
        },
      ];
      final sites = _repo().parseSitesFromOrganizations(orgs);
      expect(sites.length, 1);
      expect(sites[0].siteId, 42);
      expect(sites[0].id, 'abc');
      expect(sites[0].name, 'My Site');
      expect(sites[0].domain, 'example.com');
    });

    test('parses site with siteId as string', () {
      final orgs = [
        {
          'id': '1',
          'name': 'Org',
          'sites': [
            {
              'id': 'xyz',
              'siteId': '99',
              'name': 'String Site',
              'domain': 'test.io',
              'createdAt': '2024-02-01',
            },
          ],
        },
      ];
      final sites = _repo().parseSitesFromOrganizations(orgs);
      expect(sites.length, 1);
      expect(sites[0].siteId, 99);
    });

    test('type defaults to "web" when type field is absent', () {
      final orgs = [
        {
          'id': '1',
          'name': 'Org',
          'sites': [
            {
              'id': 'def',
              'siteId': 1,
              'name': 'No Type',
              'domain': 'notype.com',
              'createdAt': '2024-01-01',
            },
          ],
        },
      ];
      final sites = _repo().parseSitesFromOrganizations(orgs);
      expect(sites[0].type, 'web');
    });

    test('uses explicit type when provided', () {
      final orgs = [
        {
          'id': '1',
          'name': 'Org',
          'sites': [
            {
              'id': 'def',
              'siteId': 1,
              'name': 'Mobile Site',
              'domain': 'mobile.com',
              'createdAt': '2024-01-01',
              'type': 'mobile',
            },
          ],
        },
      ];
      final sites = _repo().parseSitesFromOrganizations(orgs);
      expect(sites[0].type, 'mobile');
    });

    test('falls back to id field when siteId is absent', () {
      final orgs = [
        {
          'id': '1',
          'name': 'Org',
          'sites': [
            {
              'id': '7',
              'name': 'No SiteId Field',
              'domain': 'nosid.com',
              'createdAt': '2024-01-01',
            },
          ],
        },
      ];
      final sites = _repo().parseSitesFromOrganizations(orgs);
      expect(sites[0].siteId, 7);
    });

    test('aggregates sites from multiple orgs', () {
      final orgs = [
        {
          'id': '1',
          'name': 'Org One',
          'sites': [
            {
              'id': 'a',
              'siteId': 1,
              'name': 'Site A',
              'domain': 'a.com',
              'createdAt': '2024-01-01',
            },
            {
              'id': 'b',
              'siteId': 2,
              'name': 'Site B',
              'domain': 'b.com',
              'createdAt': '2024-01-02',
            },
          ],
        },
        {
          'id': '2',
          'name': 'Org Two',
          'sites': [
            {
              'id': 'c',
              'siteId': 3,
              'name': 'Site C',
              'domain': 'c.com',
              'createdAt': '2024-01-03',
            },
          ],
        },
      ];
      final sites = _repo().parseSitesFromOrganizations(orgs);
      expect(sites.length, 3);
      expect(sites.map((s) => s.name).toList(), ['Site A', 'Site B', 'Site C']);
    });
  });

  group('SitesRepository.parseOrgNames', () {
    test('returns empty map for empty list', () {
      final names = _repo().parseOrgNames([]);
      expect(names, isEmpty);
    });

    test('parses single organization name', () {
      final orgs = [
        {'id': '1', 'name': 'Org One'},
      ];
      final names = _repo().parseOrgNames(orgs);
      expect(names, {'1': 'Org One'});
    });

    test('parses multiple organization names', () {
      final orgs = [
        {'id': '1', 'name': 'Alpha'},
        {'id': '2', 'name': 'Beta'},
        {'id': '3', 'name': 'Gamma'},
      ];
      final names = _repo().parseOrgNames(orgs);
      expect(names.length, 3);
      expect(names['1'], 'Alpha');
      expect(names['2'], 'Beta');
      expect(names['3'], 'Gamma');
    });

    test('skips org with missing id', () {
      final orgs = [
        {'name': 'No Id Org'},
        {'id': '5', 'name': 'Has Id'},
      ];
      final names = _repo().parseOrgNames(orgs);
      expect(names.length, 1);
      expect(names['5'], 'Has Id');
    });

    test('handles integer id by converting to string', () {
      final orgs = [
        {'id': 42, 'name': 'Int Id Org'},
      ];
      final names = _repo().parseOrgNames(orgs);
      expect(names['42'], 'Int Id Org');
    });
  });
}
