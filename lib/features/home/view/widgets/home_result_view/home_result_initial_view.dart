import 'package:age_estimator/core/constants/values.dart';
import 'package:age_estimator/core/extensions/context_ext.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_view.dart';
import 'package:age_estimator/features/home/view/widgets/name_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeResultInitialView extends HomeResultView {
  const HomeResultInitialView({super.key, required super.estimationState})
      : super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter Your Name:',
            style: context.textTheme.headlineSmall,
          ),
          const Gap(kSmallPadding),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kNormalPadding),
            child: NameInputWidget(),
          ),
        ],
      ),
    );
  }
}
