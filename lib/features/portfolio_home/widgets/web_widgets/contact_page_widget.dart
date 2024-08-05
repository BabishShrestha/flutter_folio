import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';
import 'package:flutter_folio/core/utils/image_path.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          UiImagePath.contact,
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 60.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: Text(
            'Contact Me',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: UIColors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.all(12.0),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: UIColors.foregroundColor,
            border: Border.symmetric(
                horizontal: BorderSide(
                  color: UIColors.primaryColor,
                  width: 4,
                ),
                vertical: BorderSide.none),
          ),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12, // Space between items in a row
              runSpacing: 12, // Space between rows
              children: [
                CustomLabelWidget(
                  iconData: Icons.email_outlined,
                  label: 'babishshrestha8@gmail.com',
                  onPressed: () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'babishshrestha8@gmail.com',
                      query: 'subject=Freelance Project&body=Ask Away!',
                    );

                    await checkAndLaunchUrl(emailLaunchUri);
                  },
                ),
                CustomLabelWidget(
                    iconData: Icons.phone,
                    label: '+977-9810127060',
                    onPressed: () async {
                      final Uri phoneLaunchUri = Uri(
                        scheme: 'tel',
                        path: '+9779810127060',
                      );
                      kIsWeb ? null : await checkAndLaunchUrl(phoneLaunchUri);
                    }),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const CustomLabelWidget(
              iconData: Icons.location_on_rounded,
              label: 'Kathmandu, Nepal',
            ),
          ]),
        ),
        const Spacer(),
        Center(
          child: Text(
            "\" Thank You For Scrolling.\nLooking Forward To Working With You.\nLet’s Build That Dream Project To Reality. \"",
            textAlign: TextAlign.center,
            maxLines: 3,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: UIColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width > 600 ? 24 : 16,
                ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

Future<void> checkAndLaunchUrl(Uri uriToLaunch) async {
  if (await canLaunchUrl(uriToLaunch)) {
    await launchUrl(uriToLaunch);
  } else {
    // Handle the situation when the email client can't be opened
    log('Could not launch $uriToLaunch');
  }
}

class CustomLabelWidget extends StatelessWidget {
  final IconData? iconData;
  final Function()? onPressed;
  final String label;

  const CustomLabelWidget({
    super.key,
    this.iconData,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: UIColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      icon: Icon(
        iconData,
        color: UIColors.white,
      ),
      // make text selectable

      label: SelectableText(
        label,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: UIColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
