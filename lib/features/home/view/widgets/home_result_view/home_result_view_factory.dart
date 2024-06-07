import 'package:age_estimator/core/bloc/app_bloc.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_error_view.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_initial_view.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_loaded_view.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_loading_view.dart';
import 'package:age_estimator/features/home/view/widgets/home_result_view/home_result_view.dart';

class HomeResultViewFactory {
  static HomeResultView create(EstimationAgeState state) {
    if (state is EstimationAgeError) {
      return HomeResultErrorView(estimationState: state);
    } else if (state is EstimationAgeLoaded) {
      return HomeResultLoadedView(estimationState: state);
    } else if (state is EstimationAgeInitial) {
      return HomeResultInitialView(estimationState: state);
    } else {
      return HomeResultLoadingView(estimationState: state);
    }
  }
}
