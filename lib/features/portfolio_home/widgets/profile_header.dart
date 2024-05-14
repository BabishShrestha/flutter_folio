import 'package:flutter/material.dart';
import 'package:flutter_folio/core/utils/colors_ui.dart';

class ProfileHeader extends StatelessWidget {
  final bool hideCloseButton;
  const ProfileHeader({
    super.key,
    this.hideCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: UIColors.buttonColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.done_rounded,
                size: 20,
              ),
            ),
          ],
        ),
        // SizedBox(
        //   width: 180,
        // ),
        hideCloseButton ? const SizedBox() : const Icon(Icons.close)
      ],
    );
  }
}
