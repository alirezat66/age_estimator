import 'package:age_estimator/core/bloc/app_bloc.dart';
import 'package:age_estimator/core/bloc/bloc_observer.dart';
import 'package:age_estimator/core/di/service_locator.dart';
import 'package:age_estimator/core/light_them.dart';
import 'package:age_estimator/features/home/view/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estimation Age App',
      theme: lightTheme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => locator<EstimationAgeCubit>(),
          ),
          BlocProvider(
            create: (context) => locator<NameCubit>(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
