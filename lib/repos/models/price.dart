import 'base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable()
class Price extends BaseModel {
  @JsonKey(defaultValue: 0.0)
  final double price;
  @JsonKey(defaultValue: 0.0, name: "volume_24h")
  final double volume24h;
  @JsonKey(defaultValue: 0.0, name: "volume_change_24h")
  final double volumeChange24h;

  Price(this.price, this.volume24h, this.volumeChange24h);

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);

  static Price convertToModel(Map<String, dynamic> json) {
    return Price.fromJson(json);
  }
}
