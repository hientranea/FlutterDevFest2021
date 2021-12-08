import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/repos/models/crypto_currency.dart';
import 'package:crypto_tracker/repos/remote/crypto_repository.dart';
import 'package:crypto_tracker/screens/currencydetail/currency_detail_screen.dart';
import 'package:crypto_tracker/screens/market/market_bloc.dart';
import 'package:crypto_tracker/utils/constants.dart';
import 'package:crypto_tracker/utils/num.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'market_event.dart';
import 'market_state.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  List<CryptoCurrency> _cryptoCurrencies = [];

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Market 24h',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildCrypto() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _cryptoCurrencies.length,
            itemBuilder: (context, index) {
              final currency = _cryptoCurrencies[index];
              return _buildCryptoItem(currency);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCryptoItem(CryptoCurrency currency) {
    final color = currency.price.usd.volumeChange24h >= 0 ? Colors.green : Colors.red;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CurrencyDetailScreen.routeName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  currency.logoUrl(),
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(currency.symbol, style: const TextStyle(fontWeight: FontWeight.w600),),
                          const Text('/USD'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Volumn 24h:',
                        style:  TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Volumn change 24h:',
                        style:  TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${doubleFormat(currency.price.usd.price)}',
                      style: TextStyle(color: color),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${doubleFormat(currency.price.usd.volume24h)}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doubleFormat(currency.price.usd.volumeChange24h),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MarketBloc>(
      create: (context) =>
          MarketBloc(RepositoryProvider.of<CryptoRepository>(context))
            ..add(MarketInitializeEvent()),
      child: BlocConsumer<MarketBloc, MarketState>(
        listener: _setListener,
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: _buildCrypto(),
          );
        },
      ),
    );
  }
}

extension ListenerStateHandler on _MarketScreenState {
  _setListener(BuildContext context, MarketState state) {
    if (state is MarketFetchCryptoCurrencies) {
      _cryptoCurrencies = state.data;
    }
  }
}
