import 'package:age_estimator/core/constants/values.dart';
import 'package:age_estimator/core/network/cache/internal_cache_repository.dart';

class InternalCacheImpl implements InternalCacheRepository {
  final Map<String, Map<String, dynamic>> _cache =
      <String, Map<String, dynamic>>{};

  @override
  void add(String key, value, [Duration? cachedValidityDuration]) {
    _cache[key] = <String, dynamic>{
      'value': value,
      'createdAt': DateTime.now(),
      'validityInSeconds':
          (cachedValidityDuration ?? kDefaultCacheValidationMinutes).inSeconds,
    };
  }

  @override
  bool checkKeyValidation(String key) {
    if (_cache.containsKey(key)) {
      final differenceInSeconds =
          DateTime.now().difference(_cache[key]!['createdAt']).inSeconds;
      final isValid = differenceInSeconds < _cache[key]!['validityInSeconds'];
      if (!isValid) {
        delete(key);
      }
      return isValid;
    }
    return false;
  }

  @override
  void delete(String key) {
    _cache.remove(key);
  }

  @override
  restore(String key) {
    if (checkKeyValidation(key)) {
      return _cache[key]!['value'];
    }
  }
}
