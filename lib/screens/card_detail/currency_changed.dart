import 'package:flutter/material.dart';

class CurrencyChanged extends StatelessWidget {
  const CurrencyChanged({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: const [
              Text(
                'USD',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '72,26',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_downward_rounded,
                size: 20,
                color: Colors.red,
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                'EUR',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '40,40',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_downward_rounded,
                size: 20,
                color: Colors.red,
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                'GBP',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '265,01',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_upward,
                size: 20,
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
