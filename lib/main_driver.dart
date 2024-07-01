import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/driver_app.dart';

void main() async {
  await initializeDateFormatting();
  runApp(
    const ProviderScope(
      child: DriverApp(),
    ),
  );
}
