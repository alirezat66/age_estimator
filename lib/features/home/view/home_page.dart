import 'package:age_estimator/core/bloc/app_bloc.dart';
import 'package:age_estimator/features/home/view/widgets/home_bottom_sheet.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_view_factory.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: const HomeBottomSheet(),
        body: Center(
          child: BlocBuilder<EstimationAgeCubit, EstimationAgeState>(
            builder: (context, state) {
              return HomeResultViewFactory.create(state);
            },
          ),
        ));
  }
}
