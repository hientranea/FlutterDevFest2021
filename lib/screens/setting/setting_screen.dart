import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/repos/local/app_preferences.dart';
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
      ),
      body: Column(
        children: <Widget>[
          SwitchListTile(
            title: const Text("Dark mode"),
            value: isDarkMode(),
            activeColor:  Theme.of(context).primaryColor,
            onChanged: (value) {
              final appBloc = BlocProvider.of<AppBloc>(context);
              appBloc.preferences.setDarkMode(value);
              appBloc.add(ChangeDarkModeEvent(value));
            },
          )
        ],
      ),
    );
  }
}
