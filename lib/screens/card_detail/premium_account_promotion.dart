import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:flutter/material.dart';

class PremiumAccountPromote extends StatelessWidget {
  const PremiumAccountPromote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: CryptoTrackerColors.primaryColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Get .Crypto Premium',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Pay for you favorite purchases online with Pro account',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CryptoTrackerColors.primaryColor),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(15.0),
                ),
              ),
              child: const Text('Start now'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
