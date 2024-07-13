import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';
import 'package:flutter_folio/core/utils/image_path.dart';
import 'package:flutter_folio/features/portfolio_home/presentation/home_view_desktop.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedPageProvider = StateProvider<PortfolioView>((ref) {
  return PortfolioView.home;
});

class FlutterFolioHome extends ConsumerWidget {
  const FlutterFolioHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          child: const HomeViewDesktop(),
          //  ScreenTypeLayout.builder(
          //   // mobile: (context) => Padding(
          //   //   padding: const EdgeInsets.all(18.0),
          //   //   child: OrientationLayoutBuilder(
          //   //     portrait: (context) => const HomeViewMobile(),
          //   //     landscape: (context) => const HomeViewTablet(),
          //   //   ),
          //   // ),
          //   // tablet: (context) => const HomeViewTablet(),
          //   desktop: (context) => const HomeViewDesktop(),
          // ),
          // // OrientationBuilder(builder: (context, constraints) {
          // //   if (constraints == Orientation.landscape) {
          // //     return const LandscapeOverviewWidget();
          // //   } else {
          // //     return const PotraitOverviewWidget();
          // //   }
          // // }),
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
