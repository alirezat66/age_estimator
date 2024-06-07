import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/bloc/app_bloc.dart';

class HomeResultErrorView extends HomeResultView {
  const HomeResultErrorView({super.key, required super.estimationState})
      : super();

  @override
  Widget build(BuildContext context) {
    final state = estimationState as EstimationAgeError;
    return Center(
      child: Text('Error: ${state.message}'),
    );
  }
}
