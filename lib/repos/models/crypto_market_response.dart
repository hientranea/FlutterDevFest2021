import 'package:crypto_tracker/repos/models/crypto_currency.dart';

import 'base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_market_response.g.dart';

@JsonSerializable()
class CryptoMarketResponse extends BaseModel {
  @JsonKey(defaultValue: [])
  final List<CryptoCurrency> data;

  CryptoMarketResponse(this.data);

  factory CryptoMarketResponse.fromJson(Map<String, dynamic> json) => _$CryptoMarketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoMarketResponseToJson(this);

  static CryptoMarketResponse convertToModel(Map<String, dynamic> json) {
    return CryptoMarketResponse.fromJson(json);
  }
}
