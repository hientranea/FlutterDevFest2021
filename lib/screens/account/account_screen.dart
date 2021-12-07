import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/screens/common/avatar_by_name.dart';
import 'package:crypto_tracker/screens/my_wallet/my_wallet_screen.dart';
import 'package:crypto_tracker/screens/setting/setting_screen.dart';
import 'package:crypto_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  _profileSection(BuildContext context) {
    return ripple(
      Container(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Row(
          children: <Widget>[
            AvatarByName(key: UniqueKey(), initialsName: "U", diameter: 64),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Welcome to Crypto Wallet",
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.only(top: 4, left: 24, right: 24, bottom: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Theme.of(context).primaryColor)),
                    ),
                    child: const Text("Login or Sign up", style: TextStyle(fontSize: 13)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }

  List<Widget> _settingSection(BuildContext context, IconData icon, String title,
      {String subtitle = "",
      bool userRequired = false,
      bool hasBottomLine = true,
      VoidCallback? onTap}) {
    return [
      ripple(
        ListTile(
          title: Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle,
              style: const TextStyle(fontSize: 13, color: CryptoTrackerColors.subtitle)),
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).primaryColor),
          onTap: () => tryInvoke(onTap),
        ),
      ),
      if (hasBottomLine) const Divider()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: UniqueKey(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ListView(
          children: <Widget>[
            const SizedBox(height: 40),
            _profileSection(context),
            Container(height: 28),
            ..._settingSection(
              context,
              Icons.account_balance_wallet_rounded,
              "My wallet",
              userRequired: true,
              onTap: () {
                Navigator.of(context).pushNamed(MyWalletScreen.routeName);
              },
            ),
            ..._settingSection(
              context,
              Icons.settings,
              "Setting",
              subtitle: "Dark mode",
              onTap: () {
                Navigator.of(context).pushNamed(SettingScreen.routeName);
              },
            ),
            ..._settingSection(context, Icons.lock_outline, "Term & Privacy", hasBottomLine: false),
          ],
        ),
      ),
    );
  }
}
