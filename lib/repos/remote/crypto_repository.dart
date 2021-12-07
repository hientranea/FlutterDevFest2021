import 'package:crypto_tracker/repos/models/crypto_currency.dart';
import 'package:crypto_tracker/repos/models/crypto_market_response.dart';
import 'package:crypto_tracker/repos/models/currency_price.dart';
import 'package:crypto_tracker/repos/models/price.dart';
import 'package:crypto_tracker/utils/constants.dart';

import '../crypto_tracker_services.dart';

abstract class CryptoRepository {
  Future<List<CryptoCurrency>> getCryptoCurrencies();

  Future<List<CurrencyPrice>> getPriceHistories(String coinSymbol, String startTime, String endTime);
}

class CryptoRepositoryImpl extends CryptoRepository {
  static final CryptoRepositoryImpl _singleton = CryptoRepositoryImpl._internal();
  final _service = CryptoTrackerServicesImpl();

  CryptoRepositoryImpl._internal();

  factory CryptoRepositoryImpl() {
    return _singleton;
  }

  @override
  Future<List<CryptoCurrency>> getCryptoCurrencies() async {
    final response = await _service.requestGet<CryptoMarketResponse>(Constants.apiListingCrypto);
    if (response.isSuccess()) {
      return response.data!.data;
    }
    return Future.value([]);
  }
  @override
  Future<List<CurrencyPrice>> getPriceHistories(String coinSymbol, String startTime, String endTime) {
    // Mock API
    return Future.value([
      CurrencyPrice(Price(16.0, 20.0, 20.0), "2021-12-01T03:06:55.668Z"),
      CurrencyPrice(Price(15.0, 20.0, 20.0), "2021-12-02T03:06:55.668Z"),
      CurrencyPrice(Price(26.0, 20.0, 20.0), "2021-12-03T03:06:55.668Z"),
      CurrencyPrice(Price(19.0, 20.0, 20.0), "2021-12-04T03:06:55.668Z"),
      CurrencyPrice(Price(6.0, 20.0, 20.0), "2021-12-05T03:06:55.668Z"),
      CurrencyPrice(Price(9.0, 20.0, 20.0), "2021-12-06T03:06:55.668Z"),
      CurrencyPrice(Price(106.0, 20.0, 20.0), "2021-12-07T03:06:55.668Z"),
    ]);
  }
}
