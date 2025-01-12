import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/repos/models/money_account.dart';
import 'package:crypto_tracker/utils/num.dart';
import 'package:flutter/material.dart';

class MoneyAccountCard extends StatelessWidget {
  final MoneyAccount moneyAccount;
  final bool? showIconSelect;

  const MoneyAccountCard({
    Key? key,
    required this.moneyAccount,
    this.showIconSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // min height = 96
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 64,
                child: Image.asset(moneyAccount.logo),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    moneyAccount.name,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    moneyAccount.detail,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Text(
                '\$${doubleFormat(moneyAccount.amount)}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Visibility(
            visible: showIconSelect == true ? moneyAccount.isSelected : false,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Icon(
                Icons.check_circle,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
