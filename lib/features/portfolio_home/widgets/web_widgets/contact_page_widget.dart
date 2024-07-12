import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';
import 'package:flutter_folio/core/utils/image_path.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          UiImagePath.contact,
          fit: BoxFit.cover,
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
          decoration: const BoxDecoration(
            color: UIColors.foregroundColor,
            border: Border.symmetric(
                horizontal: BorderSide(
                  color: UIColors.primaryColor,
                  width: 4,
                ),
                vertical: BorderSide.none),
          ),
          child: const Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLabelWidget(
                  iconData: Icons.email_outlined,
                  label: 'babishshrestha8@gmail.com',
                ),
                SizedBox(
                  width: 12,
                ),
                CustomLabelWidget(
                  iconData: Icons.phone,
                  label: '+977-9810127060',
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            CustomLabelWidget(
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
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: UIColors.primaryColor,
                  fontWeight: FontWeight.bold,
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

class CustomLabelWidget extends StatelessWidget {
  final IconData? iconData;

  final String label;

  const CustomLabelWidget({
    super.key,
    this.iconData,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
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
      label: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: UIColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
      ),
      onPressed: null,
    );
  }
}
