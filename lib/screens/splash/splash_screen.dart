import 'package:crypto_tracker/screens/home/home_screen.dart';
import 'package:crypto_tracker/screens/splash/splash_bloc.dart';
import 'package:crypto_tracker/screens/splash/splash_state.dart';
import 'package:crypto_tracker/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  _goToHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashEnd) {
            _goToHomeScreen(context);
          }
        },
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Image.asset(Constants.icSplashLogo, width: widthScreen / 2),
        ),
      ),
    );
  }
}
