import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/portfolio_home/presentation/portfolio_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Folio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlutterFolioHome(),
    );
  }
}
