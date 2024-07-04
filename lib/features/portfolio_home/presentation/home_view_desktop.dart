import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';
import 'package:flutter_folio/features/portfolio_home/presentation/portfolio_overview_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/work_list_controller.dart';
import '../widgets/web_widgets/web_widgets.dart';

class HomeViewDesktop extends ConsumerStatefulWidget {
  const HomeViewDesktop({super.key});

  @override
  ConsumerState<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

enum PortfolioView { home, about, portfolio, contact }

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
    switch (ref.watch(selectedPageProvider)) {
      case PortfolioView.home:
        return const HomePage();
      case PortfolioView.about:
        return const AboutPage();
      case PortfolioView.portfolio:
        return const PortfolioPage();
      case PortfolioView.contact:
        return const ContactPage();
      default:
        return const HomePage();
    }
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
