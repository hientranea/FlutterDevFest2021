import 'package:crypto_tracker/repos/models/price.dart';

import 'base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_price.g.dart';

@JsonSerializable()
class CurrencyPrice extends BaseModel {
  @JsonKey(name: "USD")
  final Price usd;

  CurrencyPrice(this.usd);

  factory CurrencyPrice.fromJson(Map<String, dynamic> json) => _$CurrencyPriceFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyPriceToJson(this);

  static CurrencyPrice convertToModel(Map<String, dynamic> json) {
    return CurrencyPrice.fromJson(json);
  }
}
