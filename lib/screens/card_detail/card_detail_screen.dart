import 'package:flutter/material.dart';
import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/screens/card_detail/cash_back_title.dart';
import 'package:crypto_tracker/screens/card_detail/currency_changed.dart';
import 'package:crypto_tracker/screens/card_detail/money_account_card_widget.dart';
import 'package:crypto_tracker/screens/card_detail/premium_account_promotion.dart';
import 'package:crypto_tracker/screens/card_detail/rounded_card.dart';

class CardDetailScreen extends StatelessWidget {
  const CardDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Card Details',
          style: TextStyle(
            color: CryptoTrackerColors.smokyBlack,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 24,
              color: CryptoTrackerColors.smokyBlack,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                const MoneyAccountCard(),
                const CurrencyChanged(),
                const PremiumAccountPromote(),
                const CashBackTitle(),
                RoundedCard(
                  title: 'Shoping',
                  time: '3:41 pm',
                  price: 5.00,
                  icon: Icons.shopping_cart,
                  iconBackgroundColor: Colors.yellow[700],
                ),
                RoundedCard(
                  title: 'David',
                  time: '6:46 pm',
                  price: 6.00,
                  icon: Icons.person,
                  iconBackgroundColor: Colors.yellow[700],
                ),
                RoundedCard(
                  title: 'David',
                  time: '6:46 pm',
                  price: 0.00,
                  icon: Icons.brunch_dining,
                  iconBackgroundColor: Colors.red[700],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
