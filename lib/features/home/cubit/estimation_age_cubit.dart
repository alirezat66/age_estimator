import 'package:age_estimator/features/home/model/data/estimated_age_model.dart';
import 'package:age_estimator/features/home/model/repository/estimation_age_repository.dart';

import '../../../core/bloc/app_bloc.dart';

part 'estimation_age_state.dart';

class EstimationAgeCubit extends Cubit<EstimationAgeState> {
  final EstimationAgeRepository _repository;
  EstimationAgeCubit(EstimationAgeRepository repository)
      : _repository = repository,
        super(EstimationAgeInitial());
  void getEstimatedAge(String name) async {
    emit(EstimationAgeLoading());
    try {
      final estimatedAgeModel = await _repository.getEstimatedAge(name);
      emit(EstimationAgeLoaded(estimatedAgeModel));
    } catch (e) {
      emit(EstimationAgeError(e.toString()));
    }
  }
}
