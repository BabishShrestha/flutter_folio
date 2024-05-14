import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/image_path.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/colors_ui.dart';
import '../../core/utils/font.dart';
import '../../core/widgets/fullscreen_image.dart';
import '../portfolio_home/domain/model/work_model.dart';

class PortfolioDetailsScreen extends StatelessWidget {
  final WorkModel workDetail;
  const PortfolioDetailsScreen({super.key, required this.workDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // ignore: prefer_const_constructors
                      builder: (context) =>
                          FullScreenImage(image: workDetail.projectImg
                              // image: UiImagePath.sortYourBinLogo,
                              ),
                    ),
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: workDetail.projectImg,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: UIColors.primaryColor,
                ),
                child: Center(
                  child: Text(
                    workDetail.projectTitle,
                    style: GoogleFonts.poppins(
                        fontSize: FontSize.small, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 10,
                child: IconButton(
                    color: UIColors.primaryColor,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  titleTextLabel(title: 'Tools Used:'),
                  // Tools Used Horizontal List
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 60,
                            ),
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
                    ),
                  ),

                  titleTextLabel(title: 'Project Details:'),
                  Text(
                    workDetail.projectDesc,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  titleTextLabel(title: 'Project Screenshots:'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          UiImagePath.sortYourBinScreenshot[index],
                        ),
                      ),
                      itemCount: UiImagePath.sortYourBinScreenshot.length,
                    ),
                  ),
                ],
              ),
            ),
          )

          // Project Details
        ],
      ),
    );
  }

  Padding titleTextLabel({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.normal),
      ),
    );
  }
}
