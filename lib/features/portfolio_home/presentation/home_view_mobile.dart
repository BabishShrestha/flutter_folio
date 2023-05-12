import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/image_path.dart';
import '../../portfolio_details/portfolio_details_screen.dart';
import '../data/work_list_controller.dart';
import '../widgets/portfolio_home.dart';

class HomeViewMobile extends ConsumerStatefulWidget {
  const HomeViewMobile({
    super.key,
  });

  @override
  ConsumerState<HomeViewMobile> createState() => _HomeViewMobileWidgetState();
}

class _HomeViewMobileWidgetState extends ConsumerState<HomeViewMobile> {
  @override
  void initState() {
    ref.read(workListControllerProvider.notifier).getWorkList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileHeader(),
        const TextLabel(),
        const ButtonPanel(),
        // Title
        Text(
          'My Works',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        // My Work list
        ref.watch(workListControllerProvider).maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (posts) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
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
                            builder: (context) => PortfolioDetailsScreen(
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
      ],
    );
  }
}
