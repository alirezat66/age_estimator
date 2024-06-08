import 'package:age_estimator/core/light_them.dart';
import 'package:age_estimator/features/home/cubit/estimation_age_cubit.dart';
import 'package:age_estimator/features/home/model/data/estimated_age_model.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_error_view.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_initial_view.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_loaded_view.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_loading_view.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_view_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeResultViewFactory', () {
    testWidgets('returns HomeResultErrorView when state is EstimationAgeError',
        (WidgetTester tester) async {
      var state = EstimationAgeError("");
      var result = HomeResultViewFactory.create(state);
      await tester.pumpWidget(
          Directionality(textDirection: TextDirection.ltr, child: result));
      expect(find.byType(HomeResultErrorView), findsOneWidget);
    });

    testWidgets(
        'returns HomeResultLoadedView when state is EstimationAgeLoaded',
        (WidgetTester tester) async {
      var state = EstimationAgeLoaded(
        EstimatedAgeModel(
          count: 10,
          name: "Reza",
          age: 20,
        ),
      );
      var result = HomeResultViewFactory.create(state);
      await tester.pumpWidget(
          Directionality(textDirection: TextDirection.ltr, child: result));
      expect(find.byType(HomeResultLoadedView), findsOneWidget);
    });

    testWidgets(
        'returns HomeResultInitialView when state is EstimationAgeInitial',
        (WidgetTester tester) async {
      var state = EstimationAgeInitial();
      var result = HomeResultViewFactory.create(state);
      await tester.pumpWidget(
        MaterialApp(
          theme: lightTheme,
          home: Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: result,
            ),
          ),
        ),
      );
      expect(find.byType(HomeResultInitialView), findsOneWidget);
    });

    testWidgets(
        'returns HomeResultLoadingView when state is not any of the above',
        (WidgetTester tester) async {
      var state = EstimationAgeLoading();
      var result = HomeResultViewFactory.create(state);
      await tester.pumpWidget(result);
      expect(find.byType(HomeResultLoadingView), findsOneWidget);
    });
  });
}
