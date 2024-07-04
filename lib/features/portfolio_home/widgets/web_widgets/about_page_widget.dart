import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';
import 'package:flutter_folio/core/utils/image_path.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          UiImagePath.about,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(
              left: 24.0, right: 46.0, top: 20.0, bottom: 20.0),
          child: ListView(
            children: [
              Text(
                'About',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: UIColors.white, fontWeight: FontWeight.bold),
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
                height: 24,
              ),
              Text(
                'My Skills',
                // use text theme large

                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: UIColors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
