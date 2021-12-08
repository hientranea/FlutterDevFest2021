import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final String title;
  final String time;
  final double price;
  final IconData? icon;
  final Color? iconBackgroundColor;

  const RoundedCard({
    Key? key,
    required this.title,
    required this.time,
    required this.price,
    this.icon,
    this.iconBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ],
            ),
          ),
          Text(
            price > 0 ? '+\$$price' : '-\$${price.abs()}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: price > 0 ? Colors.greenAccent : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
