import 'package:crypto_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

class CryptoExchangeData {
  String cryptoSymbol;
  String exchangeSymbol;
  String limitSell;
  String cryptoValue;
  String exchangeValue;

  CryptoExchangeData(
      {this.cryptoSymbol = "",
      this.cryptoValue = "",
      this.exchangeSymbol = "",
      this.exchangeValue = "",
      this.limitSell = ""});
}

class MarketCard extends StatelessWidget {
  final CryptoExchangeData data;

  const MarketCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(fontWeight: FontWeight.bold);
    const subtitleStyle = TextStyle(fontSize: 13);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ripple(
        Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                width: 10,
                height: 10,
                child: CircleAvatar(backgroundColor: Theme.of(context).primaryColor),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${data.cryptoSymbol} - ${data.exchangeSymbol}",
                          style: titleStyle,
                        ),
                        Text("${data.cryptoValue} ${data.cryptoSymbol}", style: titleStyle)
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Limit sell - ${data.limitSell}",
                          style: subtitleStyle,
                        ),
                        Text(
                          "\$${data.exchangeValue}",
                          style: subtitleStyle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
