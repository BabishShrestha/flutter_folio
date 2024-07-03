import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';
import 'package:flutter_folio/core/utils/image_path.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/work_list_controller.dart';

class HomeViewDesktop extends ConsumerStatefulWidget {
  const HomeViewDesktop({super.key});

  @override
  ConsumerState<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

enum PortfolioView { home, about, portfolio, contact }

class _HomeViewDesktopState extends ConsumerState<HomeViewDesktop> {
  PortfolioView selectedPage = PortfolioView.home;

  @override
  void initState() {
    ref.read(getWorkListController.notifier).getWorkList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: PortfolioView.values
              .map((view) => _buildCustomTextButton(view))
              .toList(),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildCustomTextButton(PortfolioView view) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomTextButton(
        isSelected: selectedPage == view,
        selectedPage: view,
        onPressed: () {
          setState(() {
            selectedPage = view;
          });
          log('${view.name} clicked');
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (selectedPage) {
      case PortfolioView.home:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
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
                  SizedBox(
                      height:
                          8), // Adjust the space between the lines as needed
                  Text(
                    'Mobile Application Developer & Web Developer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: UIColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Adjust the space between the lines as needed
            Expanded(
              child: Image.asset(
                UiImagePath.avatar2,
                scale: 2,
              ),
            )
          ],
        );
      case PortfolioView.about:
        return _buildAboutPage();
      case PortfolioView.portfolio:
        return _buildPortfolioPage();
      case PortfolioView.contact:
        return _buildContactPage();
    }
    // Your body content here
  }

  Widget _buildAboutPage() {
    return Column(
      children: [
        Image.asset(
          UiImagePath.avatar,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        const Text('About me'),
      ],
    );
  }

  Widget _buildPortfolioPage() {
    return const Text('Portfolio');
  }

  Widget _buildContactPage() {
    return const Text('Contact');
  }
}

class CustomTextButton extends StatelessWidget {
  final PortfolioView selectedPage;
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
