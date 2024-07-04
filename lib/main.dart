import 'package:flutter/material.dart';
import 'package:flutter_folio/core/theme/ui_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/portfolio_home/presentation/portfolio_overview_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoogleFonts.config.allowRuntimeFetching = false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Folio',
      theme: UITheme.themeData,
      home: const FlutterFolioHome(),
    );
  }
}
