import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';
import 'package:flutter_folio/core/utils/image_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return _buildDesktopScreenLayout(context);
        } else if (constraints.maxWidth > 650) {
          return _buildTabletScreenLayout(context);
        } else {
          return _buildNarrowScreenLayout(context);
        }
      },
    );
  }

  Widget _buildDesktopScreenLayout(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _buildTextContent(context)),
          const SizedBox(width: 40),
          Expanded(child: _buildImageContent()),
        ],
      ),
    );
  }

  Widget _buildTabletScreenLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildImageContent(),
          _buildTextContent(context),
        ],
      ),
    );
  }

  Widget _buildNarrowScreenLayout(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildImageContent(),
            const SizedBox(height: 20),
            _buildTextContent(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContent() {
    return Image.asset(
      UiImagePath.avatar4, // Replace with your image asset path
      fit: BoxFit.contain,
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I'm",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: UIColors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Babish Shrestha',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: UIColors.primaryColor,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Mobile Application Developer & Web Developer Full Stack',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: UIColors.white,
              fontSize: MediaQuery.of(context).size.width * 0.02,
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
              side: const BorderSide(color: UIColors.primaryColor, width: 2),
              padding: const EdgeInsets.all(20.0),
            ),
            child: const Text(
              'Contact Me',
            ),
          ),
        ],
      ),
    );
  }
}
