import 'base_event.dart';

class AppEvent extends BaseEvent {}

class AppInitializeEvent extends AppEvent {}

class ChangeDarkModeEvent extends AppEvent {
  final bool isDarkMode;

  ChangeDarkModeEvent(this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];
}

