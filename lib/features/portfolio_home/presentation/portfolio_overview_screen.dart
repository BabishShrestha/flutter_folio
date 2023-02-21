import 'dart:developer';

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
              // Title
              Text(
                'My Works',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListTile(
                  leading: Icon(Icons.heart_broken),
                  title: Text("Flutter Folio"),
                  subtitle: Text('Made with Flutter'),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.call, color: Colors.green),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.call, color: Colors.red),
                        )
                      ],
                    ),
                  )),
              Spacer(),
              MyWorkCard(),
            ],
          ),
        ),
      ),
    );
  }
}
