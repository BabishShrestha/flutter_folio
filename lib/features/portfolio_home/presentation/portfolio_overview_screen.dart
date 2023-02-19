import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/portfolio_home.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(),
              TextLabel(),
              ButtonPanel(),
              Text('My Works',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                color: Colors.grey,
                child: Column(
                  children: [
                    // title
                    Text(
                      'Sort Your Bin',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // Programming Language
                    Row(
                      children: [
                        Text(
                          'Unity',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        Flexible(
                            child: Image.asset(
                          'assets/images/unity.png',
                        )),
                      ],
                    ),
                    // description
                    Text(
                      'A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin ',
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                    // read more Button
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
