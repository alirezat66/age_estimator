import 'package:age_estimator/core/bloc/app_bloc.dart';
import 'package:age_estimator/core/constants/values.dart';
import 'package:age_estimator/core/extensions/context_ext.dart';
import 'package:age_estimator/features/home/view/widgets/estimation_button/estimation_button_strategy.dart';
import 'package:flutter/material.dart';

class HomeBottomSheet extends StatelessWidget {
  const HomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 4,
                offset: Offset(0, -2),
              ),
            ],
            borderRadius: BorderRadius.circular(kNormalRadius),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kLargePadding, horizontal: kNormalPadding),
            child: BlocBuilder<NameCubit, String>(
              builder: (context, nameState) {
                return BlocBuilder<EstimationAgeCubit, EstimationAgeState>(
                  builder: (context, state) {
                    return EstimationButtonStrategy.getButtonStrategy(state)
                        .buildButton(context, nameState);
                  },
                );
              },
            ),
          ),
        ));
  }
}
