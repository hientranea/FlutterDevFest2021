import 'package:crypto_tracker/repos/local/app_preferences.dart';
import 'package:crypto_tracker/repos/models/crypto_currency.dart';
import 'package:crypto_tracker/repos/models/crypto_market_response.dart';
import 'package:crypto_tracker/utils/constants.dart';

import '../crypto_tracker_services.dart';

abstract class CryptoRepository {
  Future<List<CryptoCurrency>> getCryptoCurrencies();
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
    print("getCryptoCurrencies");
    final response = await _service.requestGet<CryptoMarketResponse>(Constants.apiListingCrypto);
    if (response.isSuccess()) {
      return response.data!.data;
    }
    return Future.value([]);
  }
}
