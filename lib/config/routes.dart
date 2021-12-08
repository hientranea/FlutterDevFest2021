import 'package:crypto_tracker/repos/models/money_account.dart';
import 'package:crypto_tracker/screens/card_detail/card_detail_screen.dart';
import 'package:crypto_tracker/screens/currencydetail/currency_detail_screen.dart';
import 'package:crypto_tracker/screens/home/home_screen.dart';
import 'package:crypto_tracker/screens/my_wallet/my_wallet_screen.dart';
import 'package:crypto_tracker/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:crypto_tracker/screens/transfer/transfer_screen.dart';

var cryptoTrackerRoutes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  CurrencyDetailScreen.routeName: (context) => const CurrencyDetailScreen(),
  MyWalletScreen.routeName: (context) => const MyWalletScreen(),
  TransferScreen.routeName: (context) => const TransferScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(),
  CardDetailScreen.routeName: (context) => CardDetailScreen(moneyAccounts: ModalRoute.of(context)!.settings.arguments as List<MoneyAccount>),
};
