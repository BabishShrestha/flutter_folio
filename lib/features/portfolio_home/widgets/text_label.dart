import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/font.dart';

class TextLabel extends StatelessWidget {
  final bool isWeb;
  const TextLabel({
    super.key,
    this.isWeb = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Babish Shrestha',
          // style: TextStyle(fontFamily: 'Roboto', fontSize: 28),
          style: GoogleFonts.poppins(
              fontSize: isWeb ? 40 : 28, fontWeight: FontWeight.bold),
        ),
        isWeb
            ? FittedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Associate Software Developer',
                      style: GoogleFonts.poppins(
                          fontSize: FontSize.large,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '@Flutter Folio',
                      style: GoogleFonts.poppins(
                          fontSize: FontSize.large,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : FittedBox(
                child: Row(
                  children: [
                    Text(
                      'Associate Software Developer',
                      style: GoogleFonts.poppins(
                          fontSize: FontSize.xXSmall,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '@Flutter Folio',
                      style: GoogleFonts.poppins(
                          fontSize: FontSize.xXSmall,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
        // RichText(
        //     maxLines: 1,
        //     text: TextSpan(
        //         text: 'Associate Software Developer',
        //         style: GoogleFonts.poppins(
        //             fontSize: 14,
        //             color: Colors.grey,
        //             fontWeight: FontWeight.bold),
        //         children: [
        //           // TextSpan(
        //           //   text: 'Associate Software Developer',
        //           //   style: GoogleFonts.poppins(
        //           //       fontSize: 12,
        //           //       color: Colors.grey,
        //           //       fontWeight: FontWeight.bold),
        //           // ),
        //           TextSpan(
        //             text: '@Flutter Folio',
        //             style: GoogleFonts.poppins(
        //                 fontSize: 14,
        //                 color: Colors.black87,
        //                 fontWeight: FontWeight.bold),
        //           ),
        //         ])),
        const SizedBox(height: 5),
        Text(
          'A Flutter Developer from Nepal with drive and passion to enrich user experience',
          textScaleFactor: MediaQuery.of(context).textScaleFactor * 0.9,
          style: GoogleFonts.poppins(
            fontSize: isWeb ? 24 : 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
