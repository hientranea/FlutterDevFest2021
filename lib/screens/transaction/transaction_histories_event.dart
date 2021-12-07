import 'package:crypto_tracker/screens/app/base_event.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TransactionHistoriesEvent extends BaseEvent {}

class TransactionHistoriesInitializeEvent extends TransactionHistoriesEvent {}

class ToggleDateFilter extends TransactionHistoriesEvent{
  final bool shouldShow;

  ToggleDateFilter(this.shouldShow);

  @override
  List<Object?> get props => [shouldShow];
}

class ChangeDateFilter extends TransactionHistoriesEvent {
  final DateRangePickerSelectionChangedArgs args;

  ChangeDateFilter(this.args);

  @override
  List<Object?> get props => [args];
}

class SubmitDateFilter extends TransactionHistoriesEvent {}

class ClearDateFilter extends TransactionHistoriesEvent {}
