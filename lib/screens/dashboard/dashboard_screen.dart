import 'package:crypto_tracker/repos/models/crypto_currency.dart';
import 'package:crypto_tracker/repos/remote/crypto_repository.dart';
import 'package:crypto_tracker/screens/dashboard/dashboard_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<CryptoCurrency> _cryptoCurrencies = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) => DashboardBloc(RepositoryProvider.of<CryptoRepository>(context))
        ..add(DashboardInitializeEvent()),
      child: BlocConsumer<DashboardBloc, DashboardState>(
        listener: _setListener,
        builder: (context, state) {
          return Scaffold(
            body: ListView.builder(
              itemCount: _cryptoCurrencies.length,
              itemBuilder: (context, index) {
                final currency = _cryptoCurrencies[index];
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text("$index. ${currency.name}: ${currency.price.usd.price}"),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

extension ListenerStateHandler on _DashboardScreenState {
  _setListener(BuildContext context, DashboardState state) {
    if (state is DashboardFetchCryptoCurrencies) {
      _cryptoCurrencies = state.data;
    }
  }
}
