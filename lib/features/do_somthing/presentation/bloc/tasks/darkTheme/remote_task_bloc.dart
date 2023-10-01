import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_get_bored/features/do_somthing/presentation/bloc/tasks/darkTheme/remote_task_event.dart';
import 'package:not_get_bored/features/do_somthing/presentation/bloc/tasks/darkTheme/remote_task_state.dart';

class DarkThemeBloc extends Bloc<DarkThemeEvent, DarkThemeState> {
  //static DarkThemeBloc get(context) => BlocProvider.of(context);
  bool isDark = false;

  DarkThemeBloc() : super(const DarkThemeLoading()) {}

  void onDarkTheme() async {
    isDark = !isDark;
    emit(DarkThemeDone(
      isDark
    ));
    print(isDark);
  }
}
