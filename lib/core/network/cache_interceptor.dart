import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

class CacheInterceptor extends Interceptor {
  final Map<String, _CacheEntry> _cache = {};
  static const int _maxEntries = 100;
  static const Duration _defaultTtl = Duration(minutes: 5);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.method != 'GET') {
      handler.next(options);
      return;
    }

    final key = _cacheKey(options);
    final entry = _cache[key];

    if (entry != null && !entry.isExpired) {
      handler.resolve(Response(
        requestOptions: options,
        data: entry.data,
        statusCode: 200,
      ));
      return;
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.method == 'GET' && response.statusCode == 200) {
      final key = _cacheKey(response.requestOptions);
      _cache[key] =
          _CacheEntry(data: response.data, expiry: DateTime.now().add(_defaultTtl));
      _evictOldest();
    }
    handler.next(response);
  }

  void invalidate() => _cache.clear();

  String _cacheKey(RequestOptions options) => '${options.uri}';

  void _evictOldest() {
    if (_cache.length > _maxEntries) {
      _cache.remove(_cache.keys.first);
    }
  }
}

class _CacheEntry {
  final dynamic data;
  final DateTime expiry;

  _CacheEntry({required this.data, required this.expiry});

  bool get isExpired => DateTime.now().isAfter(expiry);
}

final cacheInterceptorProvider = Provider<CacheInterceptor>((ref) {
  return CacheInterceptor();
});
