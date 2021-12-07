import 'package:crypto_tracker/repos/resource.dart';

import 'models/crypto_market_response.dart';

/// Helper to convert raw data from response to Resource<T>
/// T is a generic type of model
class CryptoTrackerServiceHelper {
  static Resource<List<T>> convertToArray<T>(List<dynamic> jsonData) {
    var data;
    switch (T) {
    }
    return Resource<List<T>>.success(data);
  }

  static Resource<T> convert<T>(Map<String, dynamic> jsonData) {
    var data;
    switch (T) {
      case CryptoMarketResponse:
        data = CryptoMarketResponse.convertToModel(jsonData);
        break;
    }
    return Resource<T>.success(data);
  }
}
