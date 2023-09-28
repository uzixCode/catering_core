import 'package:flutter/material.dart';
import 'package:catering_core/core.dart';

final locator = GetIt.instance;
void setupLocatorCore() async {
  locator.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  // locator.registerLazySingleton<Alice>(() => Alice(
  //     showNotification: kDebugMode,
  //     showShareButton: true,
  //     navigatorKey: locator<GoRouter>().navigator!.context,
  //     notificationIcon: "launcher_icon_trans"));
  locator.registerSingleton<Htreq>(Htreq());
  locator<Htreq>().setToken();
  locator.registerSingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>());
}
