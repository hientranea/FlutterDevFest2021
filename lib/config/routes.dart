import 'package:crypto_tracker/screens/currencydetail/currency_detail_screen.dart';
import 'package:crypto_tracker/screens/home/home_screen.dart';
import 'package:crypto_tracker/screens/my_wallet/my_wallet_screen.dart';

var cryptoTrackerRoutes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  CurrencyDetailScreen.routeName: (context) => const CurrencyDetailScreen(),
  MyWalletScreen.routeName: (context) => const MyWalletScreen()
};
