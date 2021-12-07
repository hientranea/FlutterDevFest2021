import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/screens/card_detail/cash_back_title.dart';
import 'package:crypto_tracker/screens/card_detail/currency_changed.dart';
import 'package:crypto_tracker/screens/card_detail/money_account_card_widget.dart';
import 'package:crypto_tracker/screens/card_detail/premium_account_promotion.dart';
import 'package:crypto_tracker/screens/card_detail/rounded_card.dart';
import 'package:crypto_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

class CardDetailScreen extends StatelessWidget {
  static const routeName = "home/card_detail";

  const CardDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Card Details",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor:
            isDarkMode() ? CryptoTrackerColors.darkBackground : CryptoTrackerColors.appBarShadow,
        iconTheme: IconThemeData(
            color: isDarkMode() ? const Color(0xFFF6F6F6) : CryptoTrackerColors.heading),
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
          decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                const MoneyAccountCard("\$3,520.45", "9390"),
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
