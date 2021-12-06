
import 'package:crypto_tracker/screens/app/base_event.dart';

class HomeEvent extends BaseEvent {}

class HomeInitializeEvent extends HomeEvent {}

class SelectTabEvent extends HomeEvent {
  final int tabId;

  SelectTabEvent(this.tabId);

  @override
  List<Object> get props => [tabId];
}
