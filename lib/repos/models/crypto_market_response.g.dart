// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_market_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoMarketResponse _$CryptoMarketResponseFromJson(Map<String, dynamic> json) {
  return CryptoMarketResponse(
    (json['data'] as List<dynamic>?)
            ?.map((e) => CryptoCurrency.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$CryptoMarketResponseToJson(
        CryptoMarketResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
