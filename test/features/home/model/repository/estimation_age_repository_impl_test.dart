
import 'package:age_estimator/core/extensions/string_ext.dart';
import 'package:age_estimator/core/network/app_client.dart';
import 'package:age_estimator/features/home/model/data/estimated_age_model.dart';
import 'package:age_estimator/features/home/model/repository/estimation_age_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'estimation_age_repository_impl_test.mocks.dart';

const name = 'Reza';
@GenerateMocks([AppClient])
void main() {
  late Response response;
  late AppClient mockAppClient;
  late EstimationAgeRepositoryImpl repository;
  setUp(() {
    mockAppClient = MockAppClient();
    repository = EstimationAgeRepositoryImpl(mockAppClient);
    final json = fixture('estimated_age_model.json');
    response =
        Response(json, 200, headers: {'content-type': 'application/json'});
  });
  setupResult() {
    when(mockAppClient.get('?name=Reza'.agifyUri, isUsingCache: true))
        .thenAnswer((_) async => response);
  }

  group('EstimationAgeRepositoryImpl', () {
    test('getEstimatedAge calls AppClient.get with correct arguments',
        () async {
      setupResult();

      await repository.getEstimatedAge(name);

      verify(mockAppClient.get('?name=$name'.agifyUri,isUsingCache: true)).called(1);
    });

    test(
        'getEstimatedAge returns EstimatedAgeModel when AppClient.get succeeds',
        () async {
      setupResult();

      final result = await repository.getEstimatedAge(name);

      expect(result, isA<EstimatedAgeModel>());
    });

    test(
        'getEstimatedAge throws Exception when AppClient.get throws an exception',
        () async {
      when(mockAppClient.get('?name=$name'.agifyUri))
          .thenThrow(Exception('error'));

      expect(repository.getEstimatedAge(name), throwsException);
    });
  });
}
