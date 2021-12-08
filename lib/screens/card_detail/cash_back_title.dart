import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:flutter/material.dart';

class CashBackTitle extends StatelessWidget {
  const CashBackTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Cash Back',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 22.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          Row(
            children: const [
              Text(
                'See all',
                style: TextStyle(
                  color: CryptoTrackerColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.navigate_next_outlined,
                color: CryptoTrackerColors.primaryColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
