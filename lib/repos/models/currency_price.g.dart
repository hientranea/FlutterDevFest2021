// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyPrice _$CurrencyPriceFromJson(Map<String, dynamic> json) {
  return CurrencyPrice(
    Price.fromJson(json['USD'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrencyPriceToJson(CurrencyPrice instance) =>
    <String, dynamic>{
      'USD': instance.usd,
    };