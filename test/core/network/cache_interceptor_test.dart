import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rybbit_unofficial/core/network/cache_interceptor.dart';

// Minimal handler that records resolve/next calls.
class _TrackingHandler extends ResponseInterceptorHandler {
  Response<dynamic>? resolved;
  Response<dynamic>? nexted;

  @override
  void resolve(Response response, [bool callFollowingResponseInterceptor = false]) {
    resolved = response;
  }

  @override
  void next(Response response) {
    nexted = response;
  }
}

class _TrackingRequestHandler extends RequestInterceptorHandler {
  RequestOptions? nexted;
  Response<dynamic>? resolved;

  @override
  void next(RequestOptions options) {
    nexted = options;
  }

  @override
  void resolve(Response response, [bool callFollowingResponseInterceptor = false]) {
    resolved = response;
  }
}

RequestOptions _getOptions(String path,
    {Map<String, dynamic>? queryParameters}) {
  return RequestOptions(
    path: path,
    method: 'GET',
    queryParameters: queryParameters ?? {},
  );
}

Response<T> _response<T>(T data, RequestOptions options, {int statusCode = 200}) {
  return Response<T>(
    data: data,
    statusCode: statusCode,
    requestOptions: options,
  );
}

void main() {
  late CacheInterceptor interceptor;

  setUp(() {
    interceptor = CacheInterceptor();
  });

  group('CacheInterceptor.onRequest', () {
    test('non-GET request passes through without cache lookup', () {
      final options = RequestOptions(path: '/api/data', method: 'POST');
      final handler = _TrackingRequestHandler();

      interceptor.onRequest(options, handler);

      expect(handler.nexted, same(options));
      expect(handler.resolved, isNull);
    });

    test('GET with no cached entry calls handler.next', () {
      final options = _getOptions('/api/data');
      final handler = _TrackingRequestHandler();

      interceptor.onRequest(options, handler);

      expect(handler.nexted, same(options));
      expect(handler.resolved, isNull);
    });

    test('GET returns cached response when entry is fresh', () {
      final options = _getOptions('/api/data');

      // Populate cache via onResponse
      final responseHandler = _TrackingHandler();
      interceptor.onResponse(_response({'key': 'value'}, options), responseHandler);

      // Now request the same URL
      final requestHandler = _TrackingRequestHandler();
      interceptor.onRequest(options, requestHandler);

      expect(requestHandler.resolved, isNotNull);
      expect(requestHandler.resolved!.data, {'key': 'value'});
      expect(requestHandler.resolved!.statusCode, 200);
      expect(requestHandler.nexted, isNull);
    });

    test('different query params produce different cache keys', () {
      final optionsA = _getOptions('/api', queryParameters: {'page': '1'});
      final optionsB = _getOptions('/api', queryParameters: {'page': '2'});

      interceptor.onResponse(_response('page1', optionsA), _TrackingHandler());

      final handlerB = _TrackingRequestHandler();
      interceptor.onRequest(optionsB, handlerB);

      expect(handlerB.resolved, isNull);
      expect(handlerB.nexted, same(optionsB));
    });
  });

  group('CacheInterceptor.onResponse', () {
    test('GET 200 response is stored in cache', () {
      final options = _getOptions('/api/items');
      final handler = _TrackingHandler();

      interceptor.onResponse(_response(['item1'], options), handler);

      expect(handler.nexted, isNotNull);

      // Verify cached by requesting same URL
      final reqHandler = _TrackingRequestHandler();
      interceptor.onRequest(options, reqHandler);
      expect(reqHandler.resolved, isNotNull);
      expect(reqHandler.resolved!.data, ['item1']);
    });

    test('non-200 GET response is not cached', () {
      final options = _getOptions('/api/items');
      final responseHandler = _TrackingHandler();

      interceptor.onResponse(
        _response(null, options, statusCode: 204),
        responseHandler,
      );

      final reqHandler = _TrackingRequestHandler();
      interceptor.onRequest(options, reqHandler);

      expect(reqHandler.resolved, isNull);
      expect(reqHandler.nexted, same(options));
    });

    test('POST response is not cached', () {
      final options = RequestOptions(path: '/api/items', method: 'POST');
      final responseHandler = _TrackingHandler();

      interceptor.onResponse(_response({'ok': true}, options), responseHandler);

      // GET to same path should not find anything
      final getOptions = _getOptions('/api/items');
      final reqHandler = _TrackingRequestHandler();
      interceptor.onRequest(getOptions, reqHandler);

      expect(reqHandler.resolved, isNull);
    });
  });

  group('CacheInterceptor.invalidate', () {
    test('clears all cached entries', () {
      final options = _getOptions('/api/data');
      interceptor.onResponse(_response('cached', options), _TrackingHandler());

      interceptor.invalidate();

      final handler = _TrackingRequestHandler();
      interceptor.onRequest(options, handler);

      expect(handler.resolved, isNull);
      expect(handler.nexted, same(options));
    });
  });

  group('CacheInterceptor eviction', () {
    test('cache does not grow beyond 100 entries', () {
      for (var i = 0; i <= 100; i++) {
        final opts = _getOptions('/api/item/$i');
        interceptor.onResponse(_response(i, opts), _TrackingHandler());
      }

      // Entry 0 should have been evicted; entry 100 should still be cached.
      final evicted = _TrackingRequestHandler();
      interceptor.onRequest(_getOptions('/api/item/0'), evicted);
      expect(evicted.resolved, isNull);

      final present = _TrackingRequestHandler();
      interceptor.onRequest(_getOptions('/api/item/100'), present);
      expect(present.resolved, isNotNull);
    });
  });
}
