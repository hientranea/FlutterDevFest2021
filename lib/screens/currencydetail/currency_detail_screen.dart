import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/repos/models/currency_price.dart';
import 'package:crypto_tracker/repos/remote/crypto_repository.dart';
import 'package:crypto_tracker/screens/common/price_chart.dart';
import 'package:crypto_tracker/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'currency_detail_bloc.dart';
import 'currency_detail_event.dart';
import 'currency_detail_state.dart';
import 'market_card.dart';

class CurrencyDetailScreen extends StatefulWidget {
  static const routeName = "/currency_detail";

  const CurrencyDetailScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyDetailScreen> createState() => _CurrencyDetailScreenState();
}

class _CurrencyDetailScreenState extends State<CurrencyDetailScreen> {
  List<CurrencyPrice> _priceHistories = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrencyDetailBloc>(
      create: (context) => CurrencyDetailBloc(RepositoryProvider.of<CryptoRepository>(context))
        ..add(CurrencyDetailInitializeEvent()),
      child: BlocConsumer<CurrencyDetailBloc, CurrencyDetailState>(
        listener: _setListener,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                "Activity",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              backgroundColor: isDarkMode()
                  ? CryptoTrackerColors.darkBackground
                  : CryptoTrackerColors.appBarShadow,
              iconTheme: IconThemeData(
                  color: isDarkMode() ? const Color(0xFFF6F6F6) : CryptoTrackerColors.heading),
            ),
            body: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
                  child: PriceChart("BTC", _priceHistories),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: CryptoTrackerColors.greyBackground2,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0))),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Market",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text("See all >",
                              style:
                                  TextStyle(fontSize: 15, color: CryptoTrackerColors.primaryColor)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      MarketCard(
                        CryptoExchangeData(
                            cryptoSymbol: "BTC",
                            exchangeSymbol: "USD",
                            cryptoValue: "0.003510",
                            exchangeValue: "1,525.00",
                            limitSell: "10:36"),
                      ),
                      const SizedBox(height: 15),
                      MarketCard(
                        CryptoExchangeData(
                            cryptoSymbol: "BTC",
                            exchangeSymbol: "EUR",
                            cryptoValue: "0.003510",
                            exchangeValue: "525.00",
                            limitSell: "8:36"),
                      ),
                      const SizedBox(height: 15),
                      MarketCard(
                        CryptoExchangeData(
                            cryptoSymbol: "BTC",
                            exchangeSymbol: "VND",
                            cryptoValue: "0.003510",
                            exchangeValue: "1,525,999.00",
                            limitSell: "14:20"),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(width: 0.8, color: Colors.grey),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [Text("0.346 BTC"), Text("1,293.88 USD")],
                              ),
                            ),
                            TextButton(
                              onPressed: null,
                              child: Container(
                                child: Text(
                                  "BUY",
                                  style: TextStyle(
                                      color: Theme.of(context).cardColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: null,
                              child: Container(
                                child: Text(
                                  "SELL",
                                  style: TextStyle(
                                      color: Theme.of(context).cardColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

extension ListenerStateHandler on _CurrencyDetailScreenState {
  _setListener(BuildContext context, CurrencyDetailState state) {
    if (state is FetchedPriceHistories) {
      _priceHistories = state.data;
    }
  }
}
