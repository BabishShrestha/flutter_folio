import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/font.dart';
import '../../../core/utils/image_path.dart';
import '../../portfolio_details/portfolio_details_screen.dart';
import '../data/work_list_controller.dart';
import '../domain/model/work_model.dart';
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
    ref.read(getWorkListController.notifier).getWorkList();

    super.initState();
  }

  final work = WorkModel(
      id: '004',
      projectId: '4',
      projectTitle: 'Test',
      projectImg:
          'https://www.pexels.com/photo/red-cabrio-car-driving-in-the-desert-16307711/',
      projectDesc:
          'lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
      toolsUsed: [
        'Flutter',
        'Dart',
        'Firebase',
        'Adobe XD',
      ],
      playstoreLink: 'https://www.pexels.com');
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileHeader(),
        const TextLabel(),
        const ButtonPanel(),
        // ref.watch(workListControllerProvider).when(data: )
        TextButton(
          onPressed: () {
            ref.read(addWorkController.notifier).addWork(work);
          },
          child: const Text('Add'),
        ),
        // Title
        Text(
          'My Works',
          style: FontStyle().poppinsMedium,
        ),
        // My Work list
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
                            builder: (context) => PortfolioDetailsScreen(
                              workDetail: posts[index],
                            ),
                          ),
                        );
                      },
                      onLongPress: () {
                        ref
                            .read(removeWorkController.notifier)
                            .removeWork(posts[index]);
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
