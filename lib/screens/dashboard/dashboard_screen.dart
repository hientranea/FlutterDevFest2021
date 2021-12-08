import 'package:collection/collection.dart';
import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/repos/models/crypto_currency.dart';
import 'package:crypto_tracker/repos/models/money_account.dart';
import 'package:crypto_tracker/repos/models/transaction.dart';
import 'package:crypto_tracker/repos/remote/crypto_repository.dart';
import 'package:crypto_tracker/screens/card_detail/card_detail_screen.dart';
import 'package:crypto_tracker/screens/card_detail/card_list.dart';
import 'package:crypto_tracker/screens/card_detail/money_account_card_widget.dart';
import 'package:crypto_tracker/screens/currencydetail/currency_detail_screen.dart';
import 'package:crypto_tracker/screens/dashboard/dashboard_bloc.dart';
import 'package:crypto_tracker/screens/home/home_bloc.dart';
import 'package:crypto_tracker/screens/home/home_event.dart';
import 'package:crypto_tracker/screens/transaction/transaction_card.dart';
import 'package:crypto_tracker/utils/constants.dart';
import 'package:crypto_tracker/utils/num.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<MoneyAccount> _moneyAccounts = [];
  List<CryptoCurrency> _cryptoCurrencies = [];

  AppBar _buildAppBar() {
    return AppBar(
      leading: Center(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: CryptoTrackerColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.storm),
        ),
      ),
      actions: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                Constants.icAvatarDefault,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _heading(String text, {bool hasViewAll = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color!
                  .withOpacity(0.7),
            ),
          ),
          if (hasViewAll)
            GestureDetector(
              onTap: () {
                final bloc = BlocProvider.of<HomeBloc>(context);
                bloc.add(SelectTabEvent(2));
              },
              child: const Text("See all >",
                  style: TextStyle(
                      fontSize: 15, color: CryptoTrackerColors.primaryColor)),
            ),
        ],
      ),
    );
  }

  Widget _buildBalance() {
    final balance = _moneyAccounts.map((e) => e.amount).toList().sum;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color!
                  .withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${doubleFormat(balance)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _cryptoList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                Row(
                  children: [
                    Image.network(
                      currency.logoUrl(),
                      width: 32,
                      height: 32,
                    ),
                    Expanded(
                      child: Text(
                        '  ${currency.name}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      doubleFormat(currency.price.usd.price),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const Text(
                      ' USD',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        height: -0.1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 16),
    );
  }

  //Mock data
  _transactionList() {
    const padding = EdgeInsets.symmetric(horizontal: 16);
    return [
      Padding(
          padding: padding,
          child: TransactionCard(Transaction(
              1000, "Bob", "transfer", "2021-12-06T03:06:55.668Z"))),
      Padding(
          padding: padding,
          child: TransactionCard(Transaction(
              -2000, "Shopping", "shopping", "2021-12-05T03:06:55.668Z"))),
      Padding(
          padding: padding,
          child: TransactionCard(
              Transaction(500, "Alex", "transfer", "2021-11-01T03:06:55.668Z")))
    ];
  }

  @override
  void initState() {
    _moneyAccounts.add(MoneyAccount(
        "VISA", 'Mastercard .9090', Constants.icMasterCard, 3520.45));
    _moneyAccounts.add(MoneyAccount(
        "Paypal", 'group22@gmail.com', Constants.icPaypal, 2158.45));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) =>
          DashboardBloc(RepositoryProvider.of<CryptoRepository>(context))
            ..add(DashboardInitializeEvent()),
      child: BlocConsumer<DashboardBloc, DashboardState>(
        listener: _setListener,
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: ListView(
              children: [
                const SizedBox(height: 40),
                _buildBalance(),
                CardList(
                  moneyAccounts: _moneyAccounts,
                  onSelected: (_) {
                    Navigator.pushNamed(context, CardDetailScreen.routeName,
                        arguments: _moneyAccounts);
                  },
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
