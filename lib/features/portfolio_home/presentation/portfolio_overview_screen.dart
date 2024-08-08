import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';
import 'package:flutter_folio/core/utils/image_path.dart';
import 'package:flutter_folio/features/portfolio_home/presentation/home_view_desktop.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../widgets/web_widgets/web_widgets.dart';

final selectedPageProvider = StateProvider<PortfolioViewEnum>((ref) {
  return PortfolioViewEnum.home;
});

class FlutterFolioHome extends ConsumerStatefulWidget {
  const FlutterFolioHome({super.key});

  @override
  ConsumerState<FlutterFolioHome> createState() => _FlutterFolioHomeState();
}

final itemScrollController = ItemScrollController();

class _FlutterFolioHomeState extends ConsumerState<FlutterFolioHome> {
  final scrollController = ScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    var children = [
      Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: MediaQuery.of(context).size.height,
        child: const HomePage(),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: AboutPage(
          scrollController: scrollController,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: PortfolioPage(
          scrollController: scrollController,
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const ContactPage(),
      )
    ];

    return Scaffold(
      appBar: AppBar(
          title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                itemScrollController.scrollTo(
                  index: 0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              child: Image.asset(
                UiImagePath.logo,
                fit: BoxFit.contain,
                height: 50,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: PortfolioViewEnum.values
                    .map((view) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: _buildCustomTextButton(view, ref),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      )),
      body: SafeArea(
        child: ScrollablePositionedList.builder(
          itemCount: children.length,
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemBuilder: (context, index) {
            return children[index];
          },
        ),
      ),
      floatingActionButton: const SocialMediaWidget(),
    );
  }

  Widget _buildCustomTextButton(PortfolioViewEnum view, WidgetRef ref) {
    itemPositionsListener.itemPositions.addListener(() {
      if (itemPositionsListener.itemPositions.value
          .where((ItemPosition position) => position.index == view.index)
          .isNotEmpty) {
        ref.read(selectedPageProvider.notifier).state = view;
      }
    });

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomTextButton(
          isSelected: ref.watch(selectedPageProvider) == view,
          selectedPage: view,
          onPressed: () {
            ref.read(selectedPageProvider.notifier).state = view;
            if (ref.read(selectedPageProvider.notifier).state ==
                PortfolioViewEnum.home) {
              itemScrollController.scrollTo(
                index: 0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            } else if (ref.read(selectedPageProvider.notifier).state ==
                PortfolioViewEnum.about) {
              itemScrollController.scrollTo(
                index: 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            } else if (ref.read(selectedPageProvider.notifier).state ==
                PortfolioViewEnum.portfolio) {
              itemScrollController.scrollTo(
                index: 2,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            } else if (ref.read(selectedPageProvider.notifier).state ==
                PortfolioViewEnum.contact) {
              itemScrollController.scrollTo(
                index: 3,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            }
            log('${view.name} clicked');
          },
        )

        // ValueListenableBuilder<Iterable<ItemPosition>>(
        //     valueListenable: itemPositionsListener.itemPositions,
        //     builder: (context, positions, child) {
        //       return
        //     }),
        );
  }
}

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust sizes based on the screen width
    double dividerHeight;
    if (screenWidth >= 1200) {
      dividerHeight = 0.2;
    } else if (screenWidth >= 600) {
      dividerHeight = 0.15;
    } else {
      dividerHeight = 0.1;
    } // Smaller on larger screens
    double iconSize;
    if (screenWidth >= 1200) {
      iconSize = 40;
    } else if (screenWidth >= 600) {
      iconSize = 36;
    } else {
      iconSize = 24;
    }

    double spacing;
    if (screenWidth >= 1200) {
      spacing = 24;
    } else if (screenWidth >= 600) {
      spacing = 16;
    } else {
      spacing = 8;
    }

    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * dividerHeight,
              child: const VerticalDivider(
                color: UIColors.primaryColor,
                thickness: 2,
              ),
            ),
            SizedBox(height: spacing),
            TextButton(
              style: TextButton.styleFrom(),
              onPressed: () {
                final facebookUrl = Uri(
                    scheme: 'https',
                    host: 'www.facebook.com',
                    path: '/Life.is.strange.24.7');
                checkAndLaunchUrl(facebookUrl);
              },
              child: Image.asset(
                UiImagePath.facebookWhite,
                fit: BoxFit.contain,
                width: iconSize,
                height: iconSize,
              ),
            ),
            SizedBox(height: spacing),
            TextButton(
              onPressed: () {
                final githubUrl = Uri(
                    scheme: 'https',
                    host: 'github.com',
                    path: '/BabishShrestha/BabishShrestha');
                checkAndLaunchUrl(githubUrl);
              },
              child: Image.asset(
                UiImagePath.github,
                fit: BoxFit.contain,
                width: iconSize,
                height: iconSize,
              ),
            ),
            SizedBox(height: spacing),
            TextButton(
              onPressed: () async {
                final linkedinUrl = Uri(
                    scheme: 'https',
                    host: 'np.linkedin.com',
                    path: '/in/babish-shrestha-7b2b28151');
                await checkAndLaunchUrl(linkedinUrl);
              },
              child: Image.asset(
                UiImagePath.linkedinWhite,
                fit: BoxFit.contain,
                width: iconSize,
                height: iconSize,
              ),
            ),
          ],
        ),
      );
    });
  }
}

// class PopUpDialogBox extends StatelessWidget {
//   const PopUpDialogBox({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const AlertDialog(
//       content: Column(mainAxisSize: MainAxisSize.min, children: [
//         Text('Project Title:'),
//         Text('Project Tools:'),
//         Text('Project Description:'),
//       ]),
//     );
//   }
// }
