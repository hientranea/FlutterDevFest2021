import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/repos/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final amountColor = transaction.amount > 0 ? Colors.green : Colors.redAccent;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 0.8, color: CryptoTrackerColors.grey300),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: transaction.colorByType,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Icon(transaction.iconByType, color: Colors.white,),
          ),
          Expanded(
            child: Padding(padding: const EdgeInsets.only(left: 20), child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(height: 8),
                Text(transaction.formattedDate, style: const TextStyle(color: CryptoTrackerColors.grey600),),
              ],
            ),),
          ),
          Text(
            transaction.formattedAmount,
            style: TextStyle(
              fontSize: 16,
              color: amountColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
