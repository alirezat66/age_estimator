abstract class LocalStorageRepository {
  Future<bool> saveString(String key, String value);
  Future<String?> restoreString(String key, String? defaultValue);
}
