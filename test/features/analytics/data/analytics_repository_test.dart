import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rybbit_unofficial/features/analytics/data/analytics_repository.dart';
import 'package:rybbit_unofficial/shared/models/overview.dart';

class MockDio extends Mock implements Dio {}

Response<T> _mockResponse<T>(T data, {int statusCode = 200}) {
  return Response<T>(
    data: data,
    statusCode: statusCode,
    requestOptions: RequestOptions(path: ''),
  );
}

void main() {
  late MockDio mockDio;
  late AnalyticsRepository repo;

  const siteId = 'site-1';
  final params = <String, String>{'time_zone': 'UTC'};

  setUp(() {
    mockDio = MockDio();
    repo = AnalyticsRepository(mockDio);
  });

  // ---------------------------------------------------------------------------
  // getOverview
  // ---------------------------------------------------------------------------

  group('AnalyticsRepository.getOverview', () {
    test('Map response with data key returns Overview', () async {
      final envelope = {
        'data': {
          'sessions': 100,
          'pageviews': 200,
          'users': 50,
          'pages_per_session': 2.0,
          'bounce_rate': 0.4,
          'session_duration': 120.0,
        }
      };
      when(() => mockDio.get(
            '/api/sites/$siteId/overview',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => _mockResponse(envelope));

      final result = await repo.getOverview(siteId, params);

      expect(result.sessions, 100);
      expect(result.pageviews, 200);
      expect(result.users, 50);
    });

    test('direct Map response without data key returns Overview', () async {
      final direct = {
        'sessions': 10,
        'pageviews': 20,
        'users': 5,
        'pages_per_session': 1.5,
        'bounce_rate': 0.3,
        'session_duration': 60.0,
      };
      when(() => mockDio.get(
            '/api/sites/$siteId/overview',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => _mockResponse(direct));

      final result = await repo.getOverview(siteId, params);

      expect(result.sessions, 10);
      expect(result.pageviews, 20);
    });

    test('all-zero defaults when values are absent from map', () async {
      final envelope = {'data': <String, dynamic>{}};
      when(() => mockDio.get(
            '/api/sites/$siteId/overview',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => _mockResponse(envelope));

      final result = await repo.getOverview(siteId, params);

      expect(result, const Overview());
    });
  });

  // ---------------------------------------------------------------------------
  // getOverviewBucketed
  // ---------------------------------------------------------------------------

  group('AnalyticsRepository.getOverviewBucketed', () {
    final bucketItem = {
      'time': '2024-01-01',
      'pageviews': 5,
      'sessions': 3,
      'users': 2,
      'pages_per_session': 1.0,
      'bounce_rate': 0.5,
      'session_duration': 30.0,
    };

    test('direct List response returns list of OverviewBucket', () async {
      when(() => mockDio.get(
            '/api/sites/$siteId/overview-bucketed',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => _mockResponse([bucketItem]));

      final result = await repo.getOverviewBucketed(siteId, params);

      expect(result.length, 1);
      expect(result[0].time, '2024-01-01');
      expect(result[0].pageviews, 5);
    });

    test('Map response with data List returns list of OverviewBucket', () async {
      final envelope = {'data': [bucketItem, bucketItem]};
      when(() => mockDio.get(
            '/api/sites/$siteId/overview-bucketed',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => _mockResponse(envelope));

      final result = await repo.getOverviewBucketed(siteId, params);

      expect(result.length, 2);
    });

    test('empty List returns empty list', () async {
      when(() => mockDio.get(
            '/api/sites/$siteId/overview-bucketed',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => _mockResponse(<dynamic>[]));

      final result = await repo.getOverviewBucketed(siteId, params);

      expect(result, isEmpty);
    });

    test('Map with non-List data returns empty list', () async {
      final envelope = {'data': <String, dynamic>{}};
      when(() => mockDio.get(
            '/api/sites/$siteId/overview-bucketed',
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => _mockResponse(envelope));

      final result = await repo.getOverviewBucketed(siteId, params);

      expect(result, isEmpty);
    });
  });

  // ---------------------------------------------------------------------------
  // getLiveUserCount
  // ---------------------------------------------------------------------------

  group('AnalyticsRepository.getLiveUserCount', () {
    test('int response returns that int', () async {
      when(() => mockDio.get('/api/sites/$siteId/live-user-count'))
          .thenAnswer((_) async => _mockResponse(42));

      final result = await repo.getLiveUserCount(siteId);

      expect(result, 42);
    });

    test('Map response with count field returns count as int', () async {
      when(() => mockDio.get('/api/sites/$siteId/live-user-count'))
          .thenAnswer((_) async => _mockResponse({'count': 7}));

      final result = await repo.getLiveUserCount(siteId);

      expect(result, 7);
    });

    test('Map response with double count is truncated to int', () async {
      when(() => mockDio.get('/api/sites/$siteId/live-user-count'))
          .thenAnswer((_) async => _mockResponse({'count': 3.9}));

      final result = await repo.getLiveUserCount(siteId);

      expect(result, 3);
    });

    test('Map response without count field returns 0', () async {
      when(() => mockDio.get('/api/sites/$siteId/live-user-count'))
          .thenAnswer((_) async => _mockResponse(<String, dynamic>{}));

      final result = await repo.getLiveUserCount(siteId);

      expect(result, 0);
    });

    test('error during request returns 0', () async {
      when(() => mockDio.get('/api/sites/$siteId/live-user-count'))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.connectionError,
      ));

      final result = await repo.getLiveUserCount(siteId);

      expect(result, 0);
    });

    test('unexpected exception returns 0', () async {
      when(() => mockDio.get('/api/sites/$siteId/live-user-count'))
          .thenThrow(Exception('unexpected'));

      final result = await repo.getLiveUserCount(siteId);

      expect(result, 0);
    });
  });
}
