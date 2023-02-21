import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWorkCard extends StatelessWidget {
  const MyWorkCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
