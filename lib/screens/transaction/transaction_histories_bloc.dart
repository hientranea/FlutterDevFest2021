import 'package:bloc/bloc.dart';
import 'package:crypto_tracker/repos/remote/crypto_repository.dart';
import 'package:crypto_tracker/screens/transaction/transaction_histories_event.dart';
import 'package:crypto_tracker/screens/transaction/transaction_histories_state.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TransactionHistoriesBloc extends Bloc<TransactionHistoriesEvent, TransactionHistoriesState> {
  final CryptoRepository repository;
  String _startDateFilter = "";
  String _endDateFilter = "";

  TransactionHistoriesBloc(this.repository) : super(TransactionHistoriesInitialize());

  @override
  Stream<TransactionHistoriesState> mapEventToState(TransactionHistoriesEvent event) async* {
    if (event is TransactionHistoriesInitializeEvent) {
      final data = await repository.getTransactionHistories(_startDateFilter, _endDateFilter);
      yield FetchedTransactionHistories(data);
    }

    if (event is ToggleDateFilter) {
      yield ShowDateFilter(event.shouldShow);
    }

    if (event is ChangeDateFilter) {
      final value = event.args.value;
      if (value != null && value is PickerDateRange) {
        if (value.startDate != null) {
          _startDateFilter = DateFormat('yyyy/MM/dd').format(value.startDate!).toString();
        }
        if (value.endDate != null) {
          _endDateFilter = DateFormat('yyyy/MM/dd').format(value.endDate!).toString();
        }
      }
    }

    if (event is SubmitDateFilter) {
      final data = await repository.getTransactionHistories(_startDateFilter, _endDateFilter);
      yield FetchedTransactionHistories(data);
    }

    if (event is ClearDateFilter) {
      _startDateFilter = "";
      _endDateFilter = "";
      final data = await repository.getTransactionHistories(_startDateFilter, _endDateFilter);
      yield FetchedTransactionHistories(data);
    }
  }
}
