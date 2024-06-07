import 'package:age_estimator/core/bloc/app_bloc.dart';
import 'package:flutter/material.dart';

abstract class EstimationButtonStrategy {
  Widget buildButton(BuildContext context, String name);
  static EstimationButtonStrategy getButtonStrategy(EstimationAgeState state) {
    if (state is EstimationAgeInitial) {
      return InitialStrategy();
    } else if (state is EstimationAgeLoading) {
      return LoadingStrategy();
    } else if (state is EstimationAgeLoaded || state is EstimationAgeError) {
      return LoadedOrErrorStrategy();
    }
    return InitialStrategy(); // Default strategy
  }
}

class InitialStrategy implements EstimationButtonStrategy {
  @override
  Widget buildButton(
    BuildContext context,
    String nameState,
  ) {
    return ElevatedButton(
      onPressed: nameState.isEmpty
          ? null
          : () {
              context.read<EstimationAgeCubit>().getEstimatedAge(nameState);
            },
      child: const Text('Get Age'),
    );
  }
}

class LoadingStrategy implements EstimationButtonStrategy {
  @override
  Widget buildButton(BuildContext context, String nameState) {
    return const ElevatedButton(
      onPressed: null, // Keep it deactivated
      child: Text('Loading'),
    );
  }
}

class LoadedOrErrorStrategy implements EstimationButtonStrategy {
  @override
  Widget buildButton(BuildContext context, String nameState) {
    return ElevatedButton(
      onPressed: () {
        context.read<EstimationAgeCubit>().reset();
        context.read<NameCubit>().reset();
      },
      child: const Text('Reset'),
    );
  }
}
