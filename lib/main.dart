import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeader(),
              const TextLabel(),
              const SizedBox(height: 5),
              Text(
                'A Flutter Developer from Nepal with drive and passion to enrich user experience',
                textScaleFactor: MediaQuery.of(context).textScaleFactor * 0.9,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                ),
              ),
              const ButtonPanel(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.done_rounded,
                size: 20,
              ),
            ),
          ],
        ),
        // SizedBox(
        //   width: 180,
        // ),
        const Icon(Icons.close)
      ],
    );
  }
}

class TextLabel extends StatelessWidget {
  const TextLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Babish Shrestha',
          style: TextStyle(fontFamily: 'Roboto', fontSize: 28),
          // style: GoogleFonts.poppins(
          //     fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Associate Software Developer',
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '@Flutter Folio',
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonPanel extends StatelessWidget {
  const ButtonPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.blue[900]),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text('Hire Me'),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.grey[200]),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: const Text(
              'Follow',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
