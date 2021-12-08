import 'package:bloc/bloc.dart';
import 'package:crypto_tracker/repos/remote/crypto_repository.dart';

import 'market_event.dart';
import 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  final CryptoRepository repository;

  MarketBloc(this.repository) : super(MarketInitialize());

  @override
  Stream<MarketState> mapEventToState(MarketEvent event) async* {
    if (event is MarketInitializeEvent) {
      final data = await repository.getCryptoCurrencies();

      yield MarketFetchCryptoCurrencies(data);
    }
  }
}
