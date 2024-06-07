import 'package:age_estimator/core/network/cache/internal_cache_repository.dart';
import 'package:http/http.dart' as http;

class AppClient extends http.BaseClient {
  final InternalCacheRepository _internalCacheRepository;
  final http.Client _client;
  AppClient(
      {required InternalCacheRepository cacheRepository,
      required http.Client client})
      : _internalCacheRepository = cacheRepository,
        _client = client;
  @override
  Future<http.Response> get(Uri url,
      {Map<String, String>? headers,
      Duration? cacheDuration,
      bool isUsingCache = false}) async {
    final key = url.toString();
    if (isUsingCache && _internalCacheRepository.checkKeyValidation(key)) {
      return http.Response(_internalCacheRepository.restore(key), 200);
    }
    final response = await _client.get(url, headers: headers);
    if (response.statusCode == 200 && isUsingCache) {
      _internalCacheRepository.add(key, response.body);
    }

    return response;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request);
  }

  @override
  void close() {
    _client.close();
  }
}
