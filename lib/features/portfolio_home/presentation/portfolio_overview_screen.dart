import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folio/features/portfolio_home/presentation/home_view_desktop.dart';
import 'package:flutter_folio/features/portfolio_add/presentation/add_work_view_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_view_tablet.dart';
import 'home_view_mobile.dart';

class FlutterFolioHome extends StatelessWidget {
  const FlutterFolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        // backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).push(CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => const AddWorkScreen(),
          ));
        },
      ),
      body: SafeArea(
        child: AnimatedContainer(
          padding: const EdgeInsets.all(18.0),
          duration: const Duration(milliseconds: 300),
          child: ScreenTypeLayout.builder(
            mobile: (context) => OrientationLayoutBuilder(
              portrait: (context) => const HomeViewMobile(),
              landscape: (context) => const HomeViewTablet(),
            ),
            tablet: (context) => const HomeViewTablet(),
            desktop: (context) => const HomeViewDesktop(),
          ),
          // OrientationBuilder(builder: (context, constraints) {
          //   if (constraints == Orientation.landscape) {
          //     return const LandscapeOverviewWidget();
          //   } else {
          //     return const PotraitOverviewWidget();
          //   }
          // }),
        ),
      ),
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
