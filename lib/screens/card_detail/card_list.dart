import 'package:crypto_tracker/repos/models/money_account.dart';
import 'package:flutter/material.dart';
import 'money_account_card_widget.dart';

class CardList extends StatefulWidget {
  final List<MoneyAccount> moneyAccounts;
  final Function(MoneyAccount)? onSelected;
  final bool? showIconSelect;

  const CardList({
    Key? key,
    required this.moneyAccounts,
    this.onSelected,
    this.showIconSelect,
  }) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    final moneyAccounts = widget.moneyAccounts;

    return SizedBox(
      height: 96,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final moneyAccount = moneyAccounts[index];
          return GestureDetector(
            onTap: () {
              for (final account in moneyAccounts) {
                account.isSelected = moneyAccount.name == account.name;
              }

              if (widget.onSelected != null){
                widget.onSelected!(moneyAccount);
              }

              if (widget.showIconSelect == true){
                setState(() {
                });
              }
            },
            child: MoneyAccountCard(moneyAccount: moneyAccount, showIconSelect: widget.showIconSelect),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemCount: moneyAccounts.length,
      ),
    );
  }
}
