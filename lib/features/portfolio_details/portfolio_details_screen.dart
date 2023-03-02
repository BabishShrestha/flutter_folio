import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/image_path.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioDetailsScreen extends StatelessWidget {
  const PortfolioDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(UiImagePath.avatar),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'Sort Your Bin',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
              )
            ],
          ),
          ListView(
            padding: const EdgeInsets.all(12),
            shrinkWrap: true,
            children: [
              Text(
                'Tools Used:',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
              Row(
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      UiImagePath.unitySmall,
                      // height: 80,
                      width: 90,
                    ),
                  ),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      UiImagePath.vscode,
                      // height: 80,
                      width: 100,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
