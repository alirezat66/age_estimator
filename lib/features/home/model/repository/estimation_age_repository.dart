import 'package:age_estimator/features/home/model/data/estimated_age_model.dart';

abstract class EstimationAgeRepository{
  Future<EstimatedAgeModel> getEstimatedAge(String name);
  Future<EstimatedAgeModel> getEstimatedAgeIsolate(String name);
}