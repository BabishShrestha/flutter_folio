
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinkWidget extends StatelessWidget {
  const SocialLinkWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Facebook
        TextButton(
          onPressed: () async {
            // String email = 'fawesomegame@gmail.com';
            // String subject =
            // 'Solitaire Billionare Game Feature Request';
            // String body = '';

            final url = Uri.parse(
                'https://www.facebook.com/Life.is.strange.24.7 ');

            if (!await launchUrl(url)) {
              throw 'Could not open';
            }
          },
          child: Image.asset('assets/images/facebook.png',
              scale: 2),
        ),

        // INSTAGRAM
        TextButton(
          onPressed: () async {
            // String email = 'fawesomegame@gmail.com';
            // String subject =
            // 'Solitaire Billionare Game Feature Request';
            // String body = '';

            final url = Uri.parse(
                'https://www.instagram.com/babish_shrestha/?hl=en');

            if (!await launchUrl(url)) {
              throw 'Could not open';
            }
          },
          child: Image.asset('assets/images/instagram.png',
              scale: 2),
        ),
        //  LinkedIn
        TextButton(
          onPressed: () async {
            final url = Uri.parse(
                'https://np.linkedin.com/in/babish-shrestha-7b2b28151');

            if (!await launchUrl(url)) {
              throw 'Could not open';
            }
          },
          child: Image.asset('assets/images/linkedin.png',
              scale: 2),
        ),
        // Github
        TextButton(
          onPressed: () async {
            final url =
                Uri.parse('https://github.com/BabishShrestha');

            if (!await launchUrl(url)) {
              throw 'Could not open';
            }
          },
          child:
              Image.asset('assets/images/github.png', scale: 2),
        ),
      ],
    );
  }
}
