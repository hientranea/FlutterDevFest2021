// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    (json['amount'] as num?)?.toDouble() ?? 0.0,
    json['title'] as String? ?? '',
    json['type'] as String? ?? '',
    json['timestamp'] as String? ?? '',
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'title': instance.title,
      'type': instance.type,
      'timestamp': instance.timestamp,
    };
