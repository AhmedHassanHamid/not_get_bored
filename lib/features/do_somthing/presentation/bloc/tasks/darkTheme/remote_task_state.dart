import 'package:equatable/equatable.dart';


abstract class DarkThemeState extends Equatable {
  final bool? isDark;
  const DarkThemeState({this.isDark});

  @override
  List<Object> get props => [isDark ?? false, ];
}

class DarkThemeLoading extends DarkThemeState {
  const DarkThemeLoading();
}

class DarkThemeDone extends DarkThemeState {
  const DarkThemeDone(bool isDark) : super(isDark: isDark);
}

// class RemoteTasksError extends DarkThemeState {
//   const RemoteTasksError(DioException error) : super(error: error);
// }
