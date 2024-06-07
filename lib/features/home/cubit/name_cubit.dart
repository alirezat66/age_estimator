import '../../../core/bloc/app_bloc.dart';

class NameCubit extends Cubit<String> {
  NameCubit() : super('');
  void changeName(String name) => emit(name);
  void reset() => emit('');
}
