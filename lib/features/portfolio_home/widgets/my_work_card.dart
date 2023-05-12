import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWorkCard extends StatelessWidget {
  final VoidCallback? onTap;

  final String projectTitle;

  final String toolImage;

  final String description;

  final double? imageWidth;
  final double? imageHeight;

  const MyWorkCard({
    super.key,
    this.onTap,
    required this.projectTitle,
    required this.toolImage,
    required this.description,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      // color: Colors.grey,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        //  () {
        //   Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => const PortfolioDetailsScreen()));
        // },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Text(
                projectTitle,
                // 'Sort Your Bin',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // Programming Language
              Row(
                children: [
                  Text(
                    'Made With: ',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  Image.asset(
                    toolImage,
                    height: imageHeight ?? 50,
                    width: imageWidth ?? 80,
                  ),
                ],
              ),
              // description
              Text(
                description,
                // 'A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin ',
                maxLines: 3,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
              // read more Button
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'ReadMore >>',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
