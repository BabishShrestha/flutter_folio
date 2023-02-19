
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLabel extends StatelessWidget {
  const TextLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Babish Shrestha',
          // style: TextStyle(fontFamily: 'Roboto', fontSize: 28),
          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
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
        const SizedBox(height: 5),
        Text(
          'A Flutter Developer from Nepal with drive and passion to enrich user experience',
          textScaleFactor: MediaQuery.of(context).textScaleFactor * 0.9,
          style: GoogleFonts.poppins(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
