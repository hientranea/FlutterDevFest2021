import 'package:crypto_tracker/repos/models/crypto_currency.dart';
import 'package:crypto_tracker/screens/app/base_state.dart';

class MarketState extends BaseState {}

class MarketInitialize extends MarketState {}

class MarketFetchCryptoCurrencies extends MarketState {
  final List<CryptoCurrency> data;

  MarketFetchCryptoCurrencies(this.data);

  @override
  List<Object?> get props => [data];
}
