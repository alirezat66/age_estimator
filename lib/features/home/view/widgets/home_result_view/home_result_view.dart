import 'package:age_estimator/core/bloc/app_bloc.dart';
import 'package:flutter/widgets.dart';

abstract class HomeResultView extends StatelessWidget {
  final EstimationAgeState estimationState;
  const HomeResultView({super.key, required this.estimationState});
}
