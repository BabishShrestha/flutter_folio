import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/utils.dart';
import 'package:flutter_folio/features/portfolio_home/widgets/web_widgets/web_widgets.dart';

class PortfolioPage extends StatelessWidget {
  final ScrollController scrollController;
  const PortfolioPage({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      // controller: scrollController,
      // padding: const EdgeInsets.only(
      //     left: 24.0, right: 60.0, top: 20.0, bottom: 20.0),
      children: [
        Text(
          'Portfolio',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: UIColors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        CustomGridWidget(
          scrollController: scrollController,
          children: formattedProjectList
              .map((project) => CustomTabWidget(
                  title: project.title,
                  imagePath: project.imagePath,
                  onHover: (isHovering) {
                    if (isHovering) {
                      log('Hovering on ${project.title}');
                    }
                  }))
              .toList(),
        ),
        Text(
          'Experience',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: UIColors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const ExperienceWidget(
          year: '2024',
          jobTitle: 'Mobile Application Developer',
          companyTitle: 'Freelance',
          jobDescription:
              "Lorem ipsum dolor sit amet consectetur. Egestas accumsan vitae purus nec ac in sit. Ultricies sollicitudin sagittis nunc faucibus enim maecenas odio condimentum. Volutpat vestibulum risus vivamus rhoncus nunc integer sem ut. Accumsan porta nunc euismod vitae semper. Donec adipiscing id amet dignissim.Placerat suspendisse mi arcu odio aliquam. Et montes massa egestas consequat. Consequat eu pretium metus egestas auctor enim varius tristique. Sed egestas amet elementum consequat leo diam lobortis commodo a. Lorem dictum tortor pulvinar eget justo erat ornare ultrices. Faucibus purus blandit elementum nulla ridiculus in sociis nisl et. Erat massa scelerisque urna dolor. Donec tincidunt lobortis a aliquet massa integer. Dictumst duis mus dictumst nisl pharetra aenean id eu. Amet diam egestas tristique laoreet faucibus. Posuere egestas fames enim metus. Mi ut neque bibendum integer aliquam dictumst euismod ut porttitor.Tortor tellus rhoncus facilisis pellentesque. Tempus semper et sit curabitur odio rhoncus montes cursus. Imperdiet consectetur.",
        ),
        const ExperienceWidget(
          year: '2023',
          jobTitle: 'Executive Mobile Application Developer',
          companyTitle: 'CG Communications Ltd.',
          jobDescription:
              "Lorem ipsum dolor sit amet consectetur. Egestas accumsan vitae purus nec ac in sit. Ultricies sollicitudin sagittis nunc faucibus enim maecenas odio condimentum. Volutpat vestibulum risus vivamus rhoncus nunc integer sem ut. Accumsan porta nunc euismod vitae semper. Donec adipiscing id amet dignissim.Placerat suspendisse mi arcu odio aliquam. Et montes massa egestas consequat. Consequat eu pretium metus egestas auctor enim varius tristique. Sed egestas amet elementum consequat leo diam lobortis commodo a. Lorem dictum tortor pulvinar eget justo erat ornare ultrices. Faucibus purus blandit elementum nulla ridiculus in sociis nisl et. Erat massa scelerisque urna dolor. Donec tincidunt lobortis a aliquet massa integer. Dictumst duis mus dictumst nisl pharetra aenean id eu. Amet diam egestas tristique laoreet faucibus. Posuere egestas fames enim metus. Mi ut neque bibendum integer aliquam dictumst euismod ut porttitor.Tortor tellus rhoncus facilisis pellentesque. Tempus semper et sit curabitur odio rhoncus montes cursus. Imperdiet consectetur.",
        ),
        const ExperienceWidget(
          year: '2022',
          jobTitle: 'Associate Software Developer',
          companyTitle: 'Yellow Nepal Pvt. Ltd.',
          jobDescription:
              "Lorem ipsum dolor sit amet consectetur. Egestas accumsan vitae purus nec ac in sit. Ultricies sollicitudin sagittis nunc faucibus enim maecenas odio condimentum. Volutpat vestibulum risus vivamus rhoncus nunc integer sem ut. Accumsan porta nunc euismod vitae semper. Donec adipiscing id amet dignissim.Placerat suspendisse mi arcu odio aliquam. Et montes massa egestas consequat. Consequat eu pretium metus egestas auctor enim varius tristique. Sed egestas amet elementum consequat leo diam lobortis commodo a. Lorem dictum tortor pulvinar eget justo erat ornare ultrices. Faucibus purus blandit elementum nulla ridiculus in sociis nisl et. Erat massa scelerisque urna dolor. Donec tincidunt lobortis a aliquet massa integer. Dictumst duis mus dictumst nisl pharetra aenean id eu. Amet diam egestas tristique laoreet faucibus. Posuere egestas fames enim metus. Mi ut neque bibendum integer aliquam dictumst euismod ut porttitor.Tortor tellus rhoncus facilisis pellentesque. Tempus semper et sit curabitur odio rhoncus montes cursus. Imperdiet consectetur.",
        ),
        const ExperienceWidget(
          year: '2021',
          jobTitle: 'Flutter Developer Intern',
          companyTitle: 'Yellow Nepal Pvt. Ltd.',
          jobDescription:
              "Lorem ipsum dolor sit amet consectetur. Egestas accumsan vitae purus nec ac in sit. Ultricies sollicitudin sagittis nunc faucibus enim maecenas odio condimentum. Volutpat vestibulum risus vivamus rhoncus nunc integer sem ut. Accumsan porta nunc euismod vitae semper. Donec adipiscing id amet dignissim.Placerat suspendisse mi arcu odio aliquam. Et montes massa egestas consequat. Consequat eu pretium metus egestas auctor enim varius tristique. Sed egestas amet elementum consequat leo diam lobortis commodo a. Lorem dictum tortor pulvinar eget justo erat ornare ultrices. Faucibus purus blandit elementum nulla ridiculus in sociis nisl et. Erat massa scelerisque urna dolor. Donec tincidunt lobortis a aliquet massa integer. Dictumst duis mus dictumst nisl pharetra aenean id eu. Amet diam egestas tristique laoreet faucibus. Posuere egestas fames enim metus. Mi ut neque bibendum integer aliquam dictumst euismod ut porttitor.Tortor tellus rhoncus facilisis pellentesque. Tempus semper et sit curabitur odio rhoncus montes cursus. Imperdiet consectetur.",
        ),
      ],
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  final String year;
  final String jobTitle;
  final String companyTitle;
  final String jobDescription;
  const ExperienceWidget({
    super.key,
    required this.year,
    required this.jobTitle,
    required this.companyTitle,
    required this.jobDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,

            // Center text on the icon
            children: <Widget>[
              Image.asset(
                'assets/images/label.png',
                width: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  year, // Your text

                  style: const TextStyle(
                    color: UIColors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/red_dot.png',
              width: 40,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: const VerticalDivider(
                color: UIColors.white,
                thickness: 2,
              ),
            ),
          ],
        ),
        Expanded(
          // width: MediaQuery.of(context).size.width,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                jobTitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: UIColors.white, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  companyTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: UIColors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  jobDescription,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: UIColors.white,
                      ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
