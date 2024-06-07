import 'dart:convert';

import 'package:age_estimator/features/home/model/estimated_age_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  late Map<String, dynamic> resultMap;
  setUp(() {
    final json = fixture('estimated_age_model.json');
    resultMap = jsonDecode(json) as Map<String, dynamic>;
  });
  test('Test toMap method in model', () {
   final estimatedAgeModel =  EstimatedAgeModel.fromMap(resultMap);
    expect(estimatedAgeModel.count, 12192);
    expect(estimatedAgeModel.name, 'Reza');
    expect(estimatedAgeModel.age, 54);
  });
}
