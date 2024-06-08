import 'package:age_estimator/features/home/model/data/estimated_age_model.dart';
import 'package:age_estimator/features/home/view/widgets/estimation_button/estimation_button_strategy.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:age_estimator/core/bloc/app_bloc.dart';

void main() {
  group('EstimationButtonStrategy', () {
    testWidgets('returns InitialStrategy when state is EstimationAgeInitial',
        (WidgetTester tester) async {
      var state = EstimationAgeInitial();
      var strategy = EstimationButtonStrategy.getButtonStrategy(state);
      expect(strategy, isInstanceOf<InitialStrategy>());
    });

    testWidgets('returns LoadingStrategy when state is EstimationAgeLoading',
        (WidgetTester tester) async {
      var state = EstimationAgeLoading();
      var strategy = EstimationButtonStrategy.getButtonStrategy(state);
      expect(strategy, isInstanceOf<LoadingStrategy>());
    });

    testWidgets(
        'returns LoadedOrErrorStrategy when state is EstimationAgeLoaded',
        (WidgetTester tester) async {
      var state = EstimationAgeLoaded(
          EstimatedAgeModel(count: 10, name: "Reza", age: 50));
      var strategy = EstimationButtonStrategy.getButtonStrategy(state);
      expect(strategy, isInstanceOf<LoadedOrErrorStrategy>());
    });
    testWidgets(
        'returns LoadedOrErrorStrategy when state is EstimationAgeError',
        (WidgetTester tester) async {
      var state = EstimationAgeError("error message");
      var strategy = EstimationButtonStrategy.getButtonStrategy(state);
      expect(strategy, isInstanceOf<LoadedOrErrorStrategy>());
    });
  });
}
