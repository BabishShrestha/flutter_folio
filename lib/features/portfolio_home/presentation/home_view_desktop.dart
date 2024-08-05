import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/work_list_controller.dart';
import '../widgets/web_widgets/web_widgets.dart';

class HomeViewDesktop extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  const HomeViewDesktop({required this.scrollController, super.key});

  @override
  ConsumerState<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

enum PortfolioViewEnum { home, about, portfolio, contact }

class _HomeViewDesktopState extends ConsumerState<HomeViewDesktop> {
  @override
  void initState() {
    ref.read(getWorkListController.notifier).getWorkList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const HomePage(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            // controller: scrollController,

            children: [
              Image.asset(
                UiImagePath.about,
                fit: BoxFit.cover,
                scale: 2,
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(
                    left: 24.0, right: 60.0, top: 20.0, bottom: 20.0),
                child: Column(
                  // controller: scrollController,
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Text(
                      'About',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: UIColors.white,
                              fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text.rich(
                      textAlign: TextAlign.justify,
                      TextSpan(
                          text: "Namaste! I’m ",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: UIColors.white,
                                  ),
                          children: [
                            TextSpan(
                              text: 'Babish Shrestha',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: UIColors.primaryColor,
                                  ),
                            ),
                            TextSpan(
                              text:
                                  ", a mobile engineer specializing in Flutter and Unity. With a proven track record of creating seamless, intuitive apps, I prioritize exceptional user experience and innovative solutions tailored to client needs.\n\nDriven by a passion for creativity, my projects are influenced by hobbies like sketching, dancing, and making music, which fuel my ability to design visually appealing and functional applications. I am a quick learner, always eager to embrace new technologies, with a strong foundation in programming and problem-solving skills.\n\nCommitted to personal growth and mindfulness, my meditation practice and self-help reading enhance my problem-solving abilities and focus. As a team player with good communication skills, I am always ready to take on new challenges and work on exciting projects.\n\nExplore my portfolio to see how my skills and passions create exceptional mobile applications. Let’s collaborate to bring your vision to life.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: UIColors.white,
                                  ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'My Skills',
                      // use text theme large

                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: UIColors.white,
                              fontWeight: FontWeight.bold),
                    ),
                    CustomGridWidget(
                      scrollController: widget.scrollController,
                      children: formattedSkillList
                          .map((skill) => CustomTabWidget(
                                imagePath: skill.imagePath,
                                title: skill.title,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: PortfolioPage(
            scrollController: widget.scrollController,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const ContactPage(),
        )
      ],
    );
    // switch (ref.watch(selectedPageProvider)) {
    //   case PortfolioView.home:
    //     return const HomePage();
    //   case PortfolioView.about:
    //     return const AboutPage();
    //   case PortfolioView.portfolio:
    //     return const PortfolioPage();
    //   case PortfolioView.contact:
    //     return const ContactPage();
    //   default:
    //     return const HomePage();
    // }
  }
}

class CustomTextButton extends StatelessWidget {
  final PortfolioViewEnum selectedPage;
  final bool isSelected;
  final Function()? onPressed;

  const CustomTextButton(
      {super.key,
      required this.selectedPage,
      this.onPressed,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: isSelected
              ? UIColors.buttonSelectedColor
              : UIColors.buttonUnSelectedColor),
      onPressed: onPressed,
      child: Text(
        '${selectedPage.name[0].toUpperCase()}${selectedPage.name.substring(1)}',
      ),
    );
  }
}
