// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) {
  return Price(
    (json['price'] as num?)?.toDouble() ?? 0.0,
    (json['volume_24h'] as num?)?.toDouble() ?? 0.0,
    (json['volume_change_24h'] as num?)?.toDouble() ?? 0.0,
  );
}

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'price': instance.price,
      'volume_24h': instance.volume24h,
      'volume_change_24h': instance.volumeChange24h,
    };
