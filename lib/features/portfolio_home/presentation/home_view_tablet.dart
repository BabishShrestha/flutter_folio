import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/font.dart';
import '../../../core/utils/image_path.dart';
import '../../portfolio_details/portfolio_details_screen.dart';
import '../data/work_list_controller.dart';
import '../widgets/portfolio_home.dart';

class HomeViewTablet extends StatelessWidget {
  const HomeViewTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(
                hideCloseButton: true,
              ),
              TextLabel(),
              // const ButtonPanel(),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),

        // Title
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Works',
                style: GoogleFonts.poppins(
                    fontSize: FontSize.medium, fontWeight: FontWeight.bold),
              ),
              Consumer(
                builder: (context, ref, child) =>
                    ref.watch(getWorkListController).maybeWhen(
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          data: (posts) {
                            return Expanded(
                              child: ListView.builder(
                                itemCount: posts.length,
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => MyWorkCard(
                                  projectTitle: posts[index].projectTitle,
                                  toolImage: UiImagePath.unitySmall,
                                  description: posts[index].projectDesc,
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PortfolioDetailsScreen(
                                          workDetail: posts[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          orElse: () => const Text('Not found'),
                        ),
              ),
            ],
          ),
        ),
        // My Work list
      ],
    );
  }
}
