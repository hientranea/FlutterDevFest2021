import 'package:crypto_tracker/utils/num.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction extends BaseModel {
  @JsonKey(defaultValue: 0.0)
  final double amount;
  @JsonKey(defaultValue: "")
  final String title;
  @JsonKey(defaultValue: "")
  final String type;
  @JsonKey(defaultValue: "")
  final String timestamp;

  Transaction(this.amount, this.title, this.type, this.timestamp);

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  static Transaction convertToModel(Map<String, dynamic> json) {
    return Transaction.fromJson(json);
  }

  String get formattedDate {
    final DateTime now = DateTime.parse(timestamp);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  String get formattedAmount {
    return (amount > 0) ? "\$${doubleFormat(amount)}" : "-\$${doubleFormat(amount.abs())}";
  }

  Color get colorByType {
    switch(type) {
      case "shopping": return Colors.amber;
      case "food": return Colors.red;
      case "transfer" : return Colors.green;
    }
    return Colors.grey;
  }

  IconData get iconByType {
    switch(type) {
      case "shopping": return Icons.add_shopping_cart;
      case "food": return Icons.emoji_food_beverage_sharp;
      case "transfer" : return Icons.attach_money_sharp;
    }
    return Icons.attach_money_sharp;
  }

}
