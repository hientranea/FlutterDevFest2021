import 'package:crypto_tracker/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bottom_navigation.dart';
import 'home_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class DummyScreen extends StatelessWidget {
  final String name;

  const DummyScreen(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        alignment: Alignment.center,
        child: Text(name),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const DashboardScreen(),
    const DummyScreen("Market"),
    const DummyScreen("History"),
    const DummyScreen("Account"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc()..add(HomeInitializeEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            _stateHandler(context, state);

            return Scaffold(
              bottomNavigationBar: AppBottomNavigation(_selectedIndex),
              body: SafeArea(
                top: false,
                child: IndexedStack(
                  index: _selectedIndex,
                  children: _widgetOptions,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

extension StateHandler on _HomeScreenState {
  _stateHandler(BuildContext context, HomeState state) {
    if (state is TabChange) {
      _selectedIndex = state.tabId;
    }
  }
}
