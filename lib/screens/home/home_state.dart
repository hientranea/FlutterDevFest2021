import 'package:crypto_tracker/screens/app/base_state.dart';

class HomeState extends BaseState {}

class HomeInitialize extends HomeState {}

class TabChange extends HomeState {
  final int tabId;

  TabChange(this.tabId);

  @override
  List<Object> get props => [tabId];
}
