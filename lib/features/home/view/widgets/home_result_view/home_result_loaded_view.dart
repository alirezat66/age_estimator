import 'package:age_estimator/core/bloc/app_bloc.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_view.dart';
import 'package:flutter/material.dart';

class HomeResultLoadedView extends HomeResultView {
  const HomeResultLoadedView({super.key, required super.estimationState})
      : super();

  @override
  Widget build(BuildContext context) {
    final state = estimationState as EstimationAgeLoaded;
    return Center(
      child: Text('Your age is: ${state.estimatedAgeModel.age} years old'),
    );
  }
}
