import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I'm",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: UIColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Babish \nShrestha',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: UIColors.primaryColor,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  height: 8), // Adjust the space between the lines as needed
              const Text(
                'Mobile Application Developer & Web Developer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: UIColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: UIColors.primaryColor,
                  textStyle: const TextStyle(
                    color: UIColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  side:
                      const BorderSide(color: UIColors.primaryColor, width: 2),
                  padding: const EdgeInsets.all(20.0),
                ),
                child: const Text(
                  'Contact Me',
                ),
              ),
            ],
          ),
        ),
        // Adjust the space between the lines as needed
        Expanded(
          child: Image.asset(
            UiImagePath.avatar4,
            // scale: 3,
          ),
        )
      ],
    );
  }
}
