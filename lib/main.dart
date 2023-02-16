import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlutterFolioHome(),
    );
  }
}

class FlutterFolioHome extends StatelessWidget {
  const FlutterFolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Flutter Folio'),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
                'assets/images/avatar.png',
              width: 100,
              height: 100,
            ),
            Text('Profile'),
            Text('Name'),
            Text('Subtitle'),
          ],
        ),
      ),
    );
  }
}
