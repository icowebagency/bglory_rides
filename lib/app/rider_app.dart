import 'package:flutter/material.dart';

import '../routing/rider_routing.dart';
import '../utils/constants/text_strings.dart';
import '../utils/theme/theme.dart';

class RiderApp extends StatelessWidget {
  const RiderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: RiderRouting.router.routerDelegate,
      routeInformationParser: RiderRouting.router.routeInformationParser,
      routeInformationProvider: RiderRouting.router.routeInformationProvider,
      title: TTexts.appName,
      builder: (context, child) => Overlay(
        initialEntries: [
          if (child != null) ...[
            OverlayEntry(
              builder: (context) => child,
            ),
          ],
        ],
      ),
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
    );
  }
}
