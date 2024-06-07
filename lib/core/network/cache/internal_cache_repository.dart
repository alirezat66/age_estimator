abstract class InternalCacheRepository {
  void add(String key, dynamic value, [Duration? cachedValidityDuration]);
  void delete(String key);
  dynamic restore(String key);
  bool checkKeyValidation(String key);
}
