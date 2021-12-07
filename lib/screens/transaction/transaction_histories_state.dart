import 'package:crypto_tracker/repos/models/transaction.dart';
import 'package:crypto_tracker/screens/app/base_state.dart';

class TransactionHistoriesState extends BaseState {}

class TransactionHistoriesInitialize extends TransactionHistoriesState {}

class FetchedTransactionHistories extends TransactionHistoriesState {
  final List<Transaction> transactions;

  FetchedTransactionHistories(this.transactions);

  @override
  List<Object?> get props => [transactions];
}

class ShowDateFilter extends TransactionHistoriesState {
  final bool shouldShow;

  ShowDateFilter(this.shouldShow);

  @override
  List<Object?> get props => [shouldShow];
}
