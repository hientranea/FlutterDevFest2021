import 'base_state.dart';

class AppState extends BaseState {}

class AppInitialize extends AppState {}

class AppReady extends AppState {}

class AppChangeDarkMode extends AppState {
  final bool isDarkMode;

  AppChangeDarkMode(this.isDarkMode);

  @override
  List<Object?> get props => [isDarkMode];
}
