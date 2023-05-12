import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/image_path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../portfolio_details/portfolio_details_screen.dart';
import '../data/work_list_controller.dart';
import '../widgets/portfolio_home.dart';

class HomeViewDesktop extends ConsumerStatefulWidget {
  const HomeViewDesktop({super.key});

  @override
  ConsumerState<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

class _HomeViewDesktopState extends ConsumerState<HomeViewDesktop> {
  @override
  void initState() {
    ref.read(workListControllerProvider.notifier).getWorkList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        // profile header
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // profile image
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(UiImagePath.avatar, scale: 1.4),
              ),
            ),
            const SizedBox(
              width: 30,
            ),

            // profile details
            const Expanded(
              child: SizedBox(
                height: 400,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text Header and subheader
                      TextLabel(
                        isWeb: true,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Hire Me & Follow  button
                      ButtonPanel(),
                      SizedBox(
                        height: 30,
                      ),
                      // Social links
                      SocialLinkWidget(),
                    ]),
              ),
            ),
          ],
        ),

        // my works
        titleText(title: 'My Works'),
        ref.watch(workListControllerProvider).maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (posts) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: posts.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 100,
                    ),
                    itemBuilder: (context, index) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: MyWorkCard(
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
                  ),
                );
              },
              orElse: () => const Text('Not found'),
            ),

        // skills
        titleText(title: 'Skills'),

        // contact
      ],
    );
  }

  Text titleText({required String title}) {
    return Text(
      title,
      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
