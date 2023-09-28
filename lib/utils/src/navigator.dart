import 'dart:developer';

import 'package:flutter/material.dart';

extension BaseNavigator on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) {
    log("=> ${page.toString()}");
    return Navigator.push<T>(
        this,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }

  Future<T?> pushDialog<T extends Object?>(Widget page) {
    log("=> ${page.toString()}");
    return Navigator.push<T>(
        this,
        PageRouteBuilder(
            opaque: false,
            barrierDismissible: true,
            barrierColor: Colors.grey.withOpacity(.5),
            pageBuilder: (BuildContext context, _, __) => page));
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
      Widget page) {
    log("=> ${page.toString()}");
    return Navigator.pushReplacement<T, TO>(
        this,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }

  void pop<T extends Object?>([T? result]) => Navigator.pop<T>(this, result);
}
