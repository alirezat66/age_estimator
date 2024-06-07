import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_view.dart';
import 'package:flutter/material.dart';

class HomeResultLoadingView extends HomeResultView {
  const HomeResultLoadingView({super.key, required super.estimationState})
      : super();

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      width: kToolbarHeight,
      height: kToolbarHeight,
      child: CircularProgressIndicator.adaptive(),
    ));
  }
}
