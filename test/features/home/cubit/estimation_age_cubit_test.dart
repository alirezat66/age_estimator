import 'package:age_estimator/features/home/cubit/estimation_age_cubit.dart';
import 'package:age_estimator/features/home/model/data/estimated_age_model.dart';
import 'package:age_estimator/features/home/model/repository/estimation_age_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'estimation_age_cubit_test.mocks.dart';

@GenerateMocks([EstimationAgeRepository])
void main() {
  late EstimationAgeCubit cubit;
  late EstimationAgeRepository mockRepository;
  late EstimatedAgeModel estimatedAgeModel;
  const name = "Reza";
  setUp(() {
    mockRepository = MockEstimationAgeRepository();
    cubit = EstimationAgeCubit(mockRepository);
    estimatedAgeModel = EstimatedAgeModel(name: name, age: 20, count: 100);
  });
  setupSucceedResult() {
    when(mockRepository.getEstimatedAge(name))
        .thenAnswer((_) async => estimatedAgeModel);
  }

  setupFailureResult() {
    when(mockRepository.getEstimatedAge(name)).thenThrow(Exception('error'));
  }

  group('EstimationAgeCubit', () {
    setUp(() {});

    test(
        'getEstimatedAge emits EstimationAgeLoaded when repository returns data',
        () async {
      setupSucceedResult();

      await blocTest(
        cubit: cubit,
        act: (c) => c.getEstimatedAge(name),
        expect: [
          EstimationAgeLoading(),
          EstimationAgeLoaded(estimatedAgeModel),
        ],
      );
    });

    test(
        'getEstimatedAge emits EstimationAgeError when repository throws an exception',
        () async {
      setupFailureResult();

      await blocTest(
        cubit: cubit,
        act: (c) => c.getEstimatedAge(name),
        expect: [
          EstimationAgeLoading(),
          EstimationAgeError('error'),
        ],
      );
    });
  });
}

blocTest(
    {required EstimationAgeCubit cubit,
    required Function(dynamic c) act,
    required List<EstimationAgeState> expect}) {}
