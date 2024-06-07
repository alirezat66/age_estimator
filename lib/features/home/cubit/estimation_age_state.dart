part of 'estimation_age_cubit.dart';


class EstimationAgeState {}

final class EstimationAgeInitial extends EstimationAgeState {}

final class EstimationAgeLoading extends EstimationAgeState {}

final class EstimationAgeLoaded extends EstimationAgeState {
  final EstimatedAgeModel estimatedAgeModel;

  EstimationAgeLoaded(this.estimatedAgeModel);
}

final class EstimationAgeError extends EstimationAgeState {
  final String message;

  EstimationAgeError(this.message);
}
