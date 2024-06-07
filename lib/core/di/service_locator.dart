import 'package:age_estimator/core/network/app_client.dart';
import 'package:age_estimator/core/network/cache/internal_cache_impl.dart';
import 'package:age_estimator/core/network/cache/internal_cache_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

class ServiceLocator {
  static Future<void> setup() async {
    _locateInternalCache();
    _locateNetwork();
  }

  static void _locateInternalCache() {
    locator.registerLazySingleton<InternalCacheRepository>(
      () => InternalCacheImpl(),
    );
  }

  static void _locateNetwork() {
    locator.registerLazySingleton<http.Client>(() => http.Client());
    locator.registerLazySingleton<AppClient>(
      () => AppClient(cacheRepository: locator.get(), client: locator.get()),
    );
  }
}
