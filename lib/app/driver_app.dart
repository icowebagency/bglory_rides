import 'package:flutter/material.dart';

import '../routing/driver_routing.dart';
import '../utils/constants/text_strings.dart';
import '../utils/theme/theme.dart';

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: DriverRouting.router.routerDelegate,
      routeInformationParser: DriverRouting.router.routeInformationParser,
      routeInformationProvider: DriverRouting.router.routeInformationProvider,
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
    );
  }
}
