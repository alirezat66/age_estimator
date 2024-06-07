import 'package:age_estimator/core/bloc/app_bloc.dart';
import 'package:age_estimator/core/network/app_client.dart';
import 'package:age_estimator/core/network/cache/internal_cache_impl.dart';
import 'package:age_estimator/core/network/cache/internal_cache_repository.dart';
import 'package:age_estimator/features/home/model/repository/estimation_age_repository.dart';
import 'package:age_estimator/features/home/model/repository/estimation_age_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

class ServiceLocator {
  static Future<void> setup() async {
    _locateInternalCache();
    _locateNetwork();
    _locateEstimationCubit();
  }

  static void _locateInternalCache() {
    locator.registerLazySingleton<InternalCacheRepository>(
      () => InternalCacheImpl(),
    );
  }

  static void _locateNetwork() {
    locator.registerLazySingleton<http.Client>(() => http.Client());
    locator.registerLazySingleton<AppClient>(
      () => AppClient(
        cacheRepository: locator.get(),
        client: locator.get(),
      ),
    );
  }

  static void _locateEstimationCubit() {
    locator.registerLazySingleton<EstimationAgeRepository>(
      () => EstimationAgeRepositoryImpl(
        locator.get(),
      ),
    );
    locator.registerFactory<EstimationAgeCubit>(
      () => EstimationAgeCubit(
        locator.get(),
      ),
    );
    locator.registerFactory<NameCubit>(() => NameCubit());
  }
}
