import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';
import 'package:flutter_folio/core/utils/image_path.dart';
import 'package:flutter_folio/features/portfolio_home/presentation/home_view_desktop.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../widgets/web_widgets/web_widgets.dart';

final selectedPageProvider = StateProvider<PortfolioView>((ref) {
  return PortfolioView.home;
});

class FlutterFolioHome extends ConsumerStatefulWidget {
  const FlutterFolioHome({super.key});

  @override
  ConsumerState<FlutterFolioHome> createState() => _FlutterFolioHomeState();
}

class _FlutterFolioHomeState extends ConsumerState<FlutterFolioHome> {
  final scrollController = ScrollController();
  final itemScrollController = ItemScrollController();
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
          title: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: PortfolioView.values
                .map((view) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildCustomTextButton(view, ref),
                    ))
                .toList(),
          ),
        ),
      )),
      floatingActionButton: const SocialMediaWidget(),
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
    );
  }

  Widget _buildCustomTextButton(PortfolioView view, WidgetRef ref) {
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
                PortfolioView.home) {
              itemScrollController.scrollTo(
                index: 0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            } else if (ref.read(selectedPageProvider.notifier).state ==
                PortfolioView.about) {
              itemScrollController.scrollTo(
                index: 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            } else if (ref.read(selectedPageProvider.notifier).state ==
                PortfolioView.portfolio) {
              itemScrollController.scrollTo(
                index: 2,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            } else if (ref.read(selectedPageProvider.notifier).state ==
                PortfolioView.contact) {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
          child: const VerticalDivider(
            color: UIColors.primaryColor,
            thickness: 2,
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          style: TextButton.styleFrom(),
          onPressed: () {},
          child: Image.asset(
            UiImagePath.facebookWhite,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {},
          child: Image.asset(
            UiImagePath.instagramWhite,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {},
          child: Image.asset(
            UiImagePath.linkedinWhite,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
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
