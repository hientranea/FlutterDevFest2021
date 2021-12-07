import 'package:crypto_tracker/repos/models/currency_price.dart';
import 'package:crypto_tracker/screens/app/base_state.dart';

class CurrencyDetailState extends BaseState {}

class CurrencyDetailInitialize extends CurrencyDetailState {}

class FetchedPriceHistories extends CurrencyDetailState {
  final List<CurrencyPrice> data;

  FetchedPriceHistories(this.data);

  @override
  List<Object?> get props => [data];
}
