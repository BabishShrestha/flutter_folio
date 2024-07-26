import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';
import 'package:flutter_folio/core/utils/image_path.dart';
import 'package:flutter_folio/features/portfolio_home/presentation/home_view_desktop.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

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
  final listObserverController = ListObserverController();
  @override
  Widget build(BuildContext context) {
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
        child: ListViewObserver(
          controller: listObserverController,
          child: ListView(
            controller: scrollController,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: HomePage(),
              ),
              AboutPage(
                scrollController: scrollController,
              ),
              SizedBox(
                child: PortfolioPage(
                  scrollController: scrollController,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ContactPage(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextButton(PortfolioView view, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomTextButton(
        isSelected: ref.watch(selectedPageProvider) == view,
        selectedPage: view,
        onPressed: () {
          ref.read(selectedPageProvider.notifier).state = view;
          if (ref.read(selectedPageProvider.notifier).state ==
              PortfolioView.home) {
            listObserverController.animateTo(
              index: PortfolioView.home.index,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          } else if (ref.read(selectedPageProvider.notifier).state ==
              PortfolioView.about) {
            listObserverController.animateTo(
              index: PortfolioView.about.index,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          } else if (ref.read(selectedPageProvider.notifier).state ==
              PortfolioView.portfolio) {
            listObserverController.animateTo(
              index: PortfolioView.portfolio.index,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          } else if (ref.read(selectedPageProvider.notifier).state ==
              PortfolioView.contact) {
            listObserverController.animateTo(
              index: PortfolioView.contact.index,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          }
          log('${view.name} clicked');
        },
      ),
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
