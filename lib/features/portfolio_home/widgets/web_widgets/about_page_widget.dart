import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/utils.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class AboutPage extends StatelessWidget {
  final ScrollController scrollController;

  const AboutPage({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double childAspectRatio = 20;
    if (screenWidth < 650) {
      // Mobile
      // crossAxisCount = 2;
      childAspectRatio = 16;
    } else if (screenWidth < 1200) {
      // Tablet
      // crossAxisCount = 3;
      childAspectRatio = 14;
    } else {
      // Desktop and larger screens
      // crossAxisCount = 4;
      childAspectRatio = 20; // Adjust as needed for larger screens
    }
    return Column(
      children: [
        Image.asset(
          UiImagePath.about,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'About',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: UIColors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Text.rich(
          textAlign: TextAlign.justify,
          TextSpan(
              text: "Namaste! I’m ",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: UIColors.white,
                  ),
              children: [
                TextSpan(
                  text: 'Babish Shrestha',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: UIColors.primaryColor,
                      ),
                ),
                TextSpan(
                  text:
                      ", a mobile engineer specializing in Flutter and Unity. With a proven track record of creating seamless, intuitive apps, I prioritize exceptional user experience and innovative solutions tailored to client needs.\n\nDriven by a passion for creativity, my projects are influenced by hobbies like sketching, dancing, and making music, which fuel my ability to design visually appealing and functional applications. I am a quick learner, always eager to embrace new technologies, with a strong foundation in programming and problem-solving skills.\n\nCommitted to personal growth and mindfulness, my meditation practice and self-help reading enhance my problem-solving abilities and focus. As a team player with good communication skills, I am always ready to take on new challenges and work on exciting projects.\n\nExplore my portfolio to see how my skills and passions create exceptional mobile applications. Let’s collaborate to bring your vision to life.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: UIColors.white,
                      ),
                ),
              ]),
        ),
        const SizedBox(
          height: 36,
        ),
        Text(
          'Skills',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: UIColors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomGridWidget(
          scrollController: scrollController,
          crossAxisCount: MediaQuery.of(context).size.width < 650 ? 1 : 2,
          childAspectRatio: childAspectRatio,
          children: formattedSkillList
              .map(
                (skill) => CustomRatingTitleWidget(
                  title: skill.title,
                  rating: skill.rating!,
                ),
              )
              .toList(),
        ),
        const SizedBox(
          height: 36,
        ),
        Text(
          'My Tools',
          // use text theme large

          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: UIColors.white, fontWeight: FontWeight.bold),
        ),
        CustomGridWidget(
          scrollController: scrollController,
          children: formattedSkillList
              .map((skill) => CustomTabWidget(
                    title: skill.title,
                    imagePath: skill.imagePath,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class CustomRatingTitleWidget extends StatelessWidget {
  final String title;
  final double rating;
  const CustomRatingTitleWidget({
    super.key,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: UIColors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 12,
          ),
          SizedBox(
            height: 24,
            child: RatingStars(
              value: rating,
              starBuilder: (index, color) => Icon(
                Icons.star_rounded,
                color: color,
              ),
              starCount: 5,
              maxValue: 5,
              valueLabelVisibility: true,
              animationDuration: const Duration(milliseconds: 1000),
              starOffColor: const Color(0xffe7e8ea),
              starColor: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomGridWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<Widget> children;
  final double? childAspectRatio;
  final int? crossAxisCount;
  const CustomGridWidget({
    super.key,
    required this.scrollController,
    required this.children,
    this.childAspectRatio,
    this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;
    double childAspectRatio;

    if (screenWidth < 650) {
      // Mobile
      crossAxisCount = 2;
      childAspectRatio = 1.2;
    } else if (screenWidth < 1200) {
      // Tablet
      crossAxisCount = 3;
      childAspectRatio = 1.2;
    } else {
      // Desktop and larger screens
      crossAxisCount = 4;
      childAspectRatio = 1.4; // Adjust as needed for larger screens
    }
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: this.crossAxisCount ?? crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: this.childAspectRatio ?? childAspectRatio,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: children,
    );
  }
}

class CustomTabWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  const CustomTabWidget({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: UIColors.foregroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: UIColors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
