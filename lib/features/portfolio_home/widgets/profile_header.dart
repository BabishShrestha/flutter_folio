
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {

  const ProfileHeader({
    super.key, 
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
                color: Colors.blue,
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
        const Icon(Icons.close)
      ],
    );
  }
}
