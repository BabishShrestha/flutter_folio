import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/font.dart';
import 'features/portfolio_home/presentation/portfolio_overview_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeData(
      primaryColor: Colors.grey,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
            fontSize: FontSize.medium, fontWeight: FontWeight.bold),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Folio',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const FlutterFolioHome(),
    );
  }
}
