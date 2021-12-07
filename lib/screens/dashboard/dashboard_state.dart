import 'package:crypto_tracker/repos/models/crypto_currency.dart';
import 'package:crypto_tracker/screens/app/base_state.dart';

class DashboardState extends BaseState {}

class DashboardInitialize extends DashboardState {}

class DashboardFetchCryptoCurrencies extends DashboardState {
  final List<CryptoCurrency> data;

  DashboardFetchCryptoCurrencies(this.data);

  @override
  List<Object?> get props => [data];
}
