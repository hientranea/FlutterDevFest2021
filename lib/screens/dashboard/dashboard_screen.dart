import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/repos/models/crypto_currency.dart';
import 'package:crypto_tracker/repos/models/transaction.dart';
import 'package:crypto_tracker/repos/remote/crypto_repository.dart';
import 'package:crypto_tracker/screens/card_detail/card_detail_screen.dart';
import 'package:crypto_tracker/screens/card_detail/money_account_card_widget.dart';
import 'package:crypto_tracker/screens/currencydetail/currency_detail_screen.dart';
import 'package:crypto_tracker/screens/dashboard/dashboard_bloc.dart';
import 'package:crypto_tracker/screens/home/home_bloc.dart';
import 'package:crypto_tracker/screens/home/home_event.dart';
import 'package:crypto_tracker/screens/transaction/transaction_card.dart';
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

  _cryptoList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _cryptoCurrencies.length,
      itemBuilder: (context, index) {
        final currency = _cryptoCurrencies[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CurrencyDetailScreen.routeName);
          },
          child: Container(
            height: 100,
            width: 150,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/coin_bg.png"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(15.0)),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency.name,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(height: 20),
                Text(
                  currency.price.usd.formattedPrice,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  //Mock data
  _transactionList() {
    const padding = EdgeInsets.symmetric(horizontal: 10);
    return [
      Padding(
          padding: padding,
          child: TransactionCard(Transaction(1000, "Bob", "transfer", "2021-12-06T03:06:55.668Z"))),
      Padding(
          padding: padding,
          child: TransactionCard(
              Transaction(-2000, "Shopping", "shopping", "2021-12-05T03:06:55.668Z"))),
      Padding(
          padding: padding,
          child: TransactionCard(Transaction(500, "Alex", "transfer", "2021-11-01T03:06:55.668Z")))
    ];
  }

  _cardList() {
    // Mock data
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, CardDetailScreen.routeName),
          child:  MoneyAccountCard("\$3,520.45", "9390"),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, CardDetailScreen.routeName),
          child:  MoneyAccountCard("\$520.45", "3537"),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, CardDetailScreen.routeName),
          child:  MoneyAccountCard("\$99999520.45", "4242"),
        )
      ],
    );
  }

  _heading(String text, {bool hasViewAll = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.7)),
          ),
          if (hasViewAll)
            GestureDetector(
              onTap: () {
                final bloc = BlocProvider.of<HomeBloc>(context);
                bloc.add(SelectTabEvent(2));
              },
              child: const Text("View all >",
                  style: TextStyle(fontSize: 15, color: CryptoTrackerColors.primaryColor)),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) => DashboardBloc(RepositoryProvider.of<CryptoRepository>(context))
        ..add(DashboardInitializeEvent()),
      child: BlocConsumer<DashboardBloc, DashboardState>(
        listener: _setListener,
        builder: (context, state) {
          return Scaffold(
            body: ListView(
              children: [
                const SizedBox(height: 40),
                _heading("Balance"),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    "\$15,378.32",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 123,
                  child: _cardList(),
                ),
                const SizedBox(height: 25),
                _heading("Activity"),
                SizedBox(
                  height: 200,
                  child: _cryptoList(),
                ),
                const SizedBox(height: 25),
                _heading("Transactions", hasViewAll: true),
                ..._transactionList()
              ],
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
