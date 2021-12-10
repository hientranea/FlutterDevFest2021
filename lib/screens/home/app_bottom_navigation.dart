import 'package:crypto_tracker/config/crypto_tracker_color.dart';
import 'package:crypto_tracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';
import 'home_event.dart';

class HomeTab {
  const HomeTab(this.title, this.icon);

  final String title;
  final IconData icon;
}

class AppBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final List<HomeTab> allTabs = <HomeTab>[
    const HomeTab("Home", Icons.home),
    const HomeTab("Market", Icons.monetization_on),
    const HomeTab("History", Icons.watch_later),
    const HomeTab("Account", Icons.account_circle)
  ];

  AppBottomNavigation(this.selectedIndex, {Key? key}) : super(key: key);

  _onTabTapped(BuildContext context, int index) {
    BlocProvider.of<HomeBloc>(context).add(SelectTabEvent(index));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: BottomNavigationBar(
        backgroundColor: isDarkMode() ? CryptoTrackerColors.darkBackground : CryptoTrackerColors.bottomBarBackground,
        items: allTabs.map((HomeTab tab) {
          return BottomNavigationBarItem(icon: Icon(tab.icon), label: tab.title);
        }).toList(),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
        unselectedItemColor: Colors.grey,
        onTap: (index) => _onTabTapped(context, index),
      ),
    );
  }
}
