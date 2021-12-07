import 'package:crypto_tracker/repos/models/currency_price.dart';

import 'base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_currency.g.dart';

@JsonSerializable()
class CryptoCurrency extends BaseModel {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: "")
  final String name;
  @JsonKey(defaultValue: "")
  final String symbol;
  @JsonKey(name: "quote")
  final CurrencyPrice price;

  CryptoCurrency(this.id, this.name, this.symbol, this.price);

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) => _$CryptoCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoCurrencyToJson(this);

  static CryptoCurrency convertToModel(Map<String, dynamic> json) {
    return CryptoCurrency.fromJson(json);
  }
}
