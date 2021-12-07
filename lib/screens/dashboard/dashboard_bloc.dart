import 'package:bloc/bloc.dart';
import 'package:crypto_tracker/repos/remote/crypto_repository.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final CryptoRepository repository;

  DashboardBloc(this.repository) : super(DashboardInitialize());

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is DashboardInitializeEvent) {
      print("DashboardInitializeEvent");
      final data = await repository.getCryptoCurrencies();

      yield DashboardFetchCryptoCurrencies(data);
    }
  }
}
