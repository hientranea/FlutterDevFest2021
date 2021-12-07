import 'package:bloc/bloc.dart';
import 'package:crypto_tracker/repos/remote/crypto_repository.dart';

import 'currency_detail_event.dart';
import 'currency_detail_state.dart';

class CurrencyDetailBloc extends Bloc<CurrencyDetailEvent, CurrencyDetailState> {
  final CryptoRepository repository;

  CurrencyDetailBloc(this.repository) : super(CurrencyDetailInitialize());

  @override
  Stream<CurrencyDetailState> mapEventToState(CurrencyDetailEvent event) async* {
    if (event is CurrencyDetailInitializeEvent) {
      final data = await repository.getPriceHistories("BTC", "", "");
      yield FetchedPriceHistories(data);
    }
  }
}
