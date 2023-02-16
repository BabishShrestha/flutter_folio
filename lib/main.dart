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
              Row(
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
                  Icon(Icons.close)
                ],
              ),
              const Text(
                'Babish Shrestha',
                style: TextStyle(fontFamily: 'Roboto', fontSize: 28),
                // style: GoogleFonts.poppins(
                //     fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text('Creative director at'),
                  Text('@Flutter Folio',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      )),
                ],
              ),

              // Text.rich(
              //     textScaleFactor: MediaQuery.of(context).textScaleFactor * 0.9,
              //     const TextSpan(
              //         text: 'Associate Software Developer ',
              //         children: [
              //           TextSpan(
              //               text: ' @Flutter Folio',
              //               style: TextStyle(
              //                 color: Colors.amber,
              //               )),
              //         ]),
              //     style: GoogleFonts.poppins(
              //         color: Colors.black45, fontWeight: FontWeight.bold)),
              // const SizedBox(
              //   height: 10,
              // ),
              
              Text(  
                'A Flutter Developer from Nepal with drive and passion to enrich user experience',
                textScaleFactor: MediaQuery.of(context).textScaleFactor * 0.9,
                style: GoogleFonts.poppins(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
