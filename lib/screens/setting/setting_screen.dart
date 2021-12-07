import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/screens/app/app_bloc.dart';
import 'package:crypto_tracker/screens/app/app_event.dart';
import 'package:crypto_tracker/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = "home/account/settings";

  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Setting",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor:
            isDarkMode() ? CryptoTrackerColors.darkBackground : CryptoTrackerColors.appBarShadow,
        iconTheme: IconThemeData(
            color: isDarkMode() ? const Color(0xFFF6F6F6) : CryptoTrackerColors.heading),
      ),
      body: Column(
        children: <Widget>[
          SwitchListTile(
            title: const Text("Dark mode"),
            value: isDarkMode(),
            onChanged: (value) {
              BlocProvider.of<AppBloc>(context).add(ChangeDarkModeEvent(value));
            },
          )
        ],
      ),
    );
  }
}
