import 'package:age_estimator/core/storage/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesStorageImpl implements LocalStorageRepository {
  final SharedPreferences _sharedPreferences;
  PreferencesStorageImpl(SharedPreferences preferences)
      : _sharedPreferences = preferences;

  @override
  Future<String> restoreString(String key, String? defaultValue) {
    return Future.value(_sharedPreferences.getString(key) ?? defaultValue);
  }

  @override
  Future<bool> saveString(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }
}
