// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCurrency _$CryptoCurrencyFromJson(Map<String, dynamic> json) {
  return CryptoCurrency(
    json['id'] as int? ?? 0,
    json['name'] as String? ?? '',
    json['symbol'] as String? ?? '',
    CurrencyPrice.fromJson(json['quote'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CryptoCurrencyToJson(CryptoCurrency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'quote': instance.price,
    };
