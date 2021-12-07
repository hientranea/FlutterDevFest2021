import 'package:crypto_tracker/screens/app/main.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

wait(int delayTimeInMs) async {
  await Future.delayed(Duration(milliseconds: delayTimeInMs));
}

String prepareRequestUrl(String serviceName) {
return Constants.urlBase  + serviceName;
}

tryInvoke(VoidCallback? callback) {
  if (callback != null) {
    callback();
  }
}

bool isDarkMode() {
  return themeMode == ThemeMode.dark;
}

Widget ripple(Widget widget, {VoidCallback? onTap}) {
  return Material(
      color: Colors.transparent, child: InkWell(onTap: () => tryInvoke(onTap), child: widget));
}
