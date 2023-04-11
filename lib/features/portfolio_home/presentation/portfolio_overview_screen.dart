import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/image_path.dart';
import 'package:flutter_folio/features/portfolio_home/data/work_list_controller.dart';
import 'package:flutter_folio/features/portfolio_home/data/work_list_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../portfolio_details/portfolio_details_screen.dart';
import '../widgets/portfolio_home.dart';

class FlutterFolioHome extends StatelessWidget {
  const FlutterFolioHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Flutter Folio'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: OrientationBuilder(builder: (context, constraints) {
              if (constraints == Orientation.landscape) {
                return const LandscapeOverviewWIdget();
              } else {
                return const PotraitOverviewWidget();
              }
            }),
          ),
        ),
      ),
    );
  }
}

class LandscapeOverviewWIdget extends StatelessWidget {
  const LandscapeOverviewWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
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
        // const Divider(
        //   height: 10,
        // ),
        // Title
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Works',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    MyWorkCard(
                      projectTitle: 'Sort Your Bin',
                      toolImage: UiImagePath.unitySmall,
                      description:
                          'A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin ',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const PortfolioDetailsScreen()));
                      },
                    ),
                    MyWorkCard(
                      projectTitle: 'Solitaire Billionaire',
                      toolImage: UiImagePath.flutter,
                      imageHeight: 30,
                      imageWidth: 30,
                      description:
                          'A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin ',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const PortfolioDetailsScreen()));
                      },
                    ),
                    MyWorkCard(
                      projectTitle: 'SmartBin',
                      toolImage: UiImagePath.unitySmall,
                      description:
                          'A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin ',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const PortfolioDetailsScreen()));
                      },
                    ),
                  ],
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

class PotraitOverviewWidget extends ConsumerStatefulWidget {
  const PotraitOverviewWidget({
    super.key,
  });

  @override
  ConsumerState<PotraitOverviewWidget> createState() =>
      _PotraitOverviewWidgetState();
}

class _PotraitOverviewWidgetState extends ConsumerState<PotraitOverviewWidget> {
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
        ref.watch(workListControllerProvider).maybeWhen(
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            data: (posts) => Text(posts[0].title),
            orElse: () => const Text('Not found')),
        // My Work list
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView(
            // shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              MyWorkCard(
                projectTitle: 'Sort Your Bin',
                toolImage: UiImagePath.unitySmall,
                description:
                    'A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin ',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PortfolioDetailsScreen()));
                },
              ),
              MyWorkCard(
                projectTitle: 'Solitaire Billionaire',
                toolImage: UiImagePath.flutter,
                imageHeight: 30,
                imageWidth: 30,
                description:
                    'A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin ',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PortfolioDetailsScreen()));
                },
              ),
              MyWorkCard(
                projectTitle: 'SmartBin',
                toolImage: UiImagePath.unitySmall,
                description:
                    'A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin A Flutter app to sort your bin ',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PortfolioDetailsScreen()));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
