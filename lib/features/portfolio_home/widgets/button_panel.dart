import 'dart:developer' as dev;

import 'package:flutter/material.dart';

class ButtonPanel extends StatefulWidget {
  const ButtonPanel({
    super.key,
  });

  @override
  State<ButtonPanel> createState() => _ButtonPanelState();
}

class _ButtonPanelState extends State<ButtonPanel> {
  Color? followBGColor = Colors.grey[200];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: profileButton(
            defaultButtonColor: Colors.blue[900] as Color,
            textColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add),
                Text('Hire Me'),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Expanded(
        //   child: profileButton(
        //       // defaultButtonColor: Colors.grey[200] as Color,
        //       textColor: Colors.black,
        //       child: const Text(
        //         'Follow',
        //         style: TextStyle(color: Colors.black),
        //       )),
        // ),
        SecondButtonWidget(
          defaultColor: Colors.grey[200] as Color,
          onPressedColor: Colors.pink,
        ),
      ],
    );
  }

  ElevatedButton profileButton(
      {Color defaultButtonColor = const Color(0xffd4d4d4),
      Color onPressedColor = Colors.blue,
      required Color textColor,
      required Widget child}) {
    Color? buttonColor;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          // fixedSize: Size(200, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: buttonColor),
      onPressed: () {
        setState(() {
          if (buttonColor == defaultButtonColor) {
            buttonColor = onPressedColor;
          } else {
            buttonColor = defaultButtonColor;
          }
        });
      },
      child: child,
    );
  }
}

class SecondButtonWidget extends StatefulWidget {
  final Color defaultColor;
  final Color onPressedColor;
  const SecondButtonWidget(
      {super.key,
      this.defaultColor = Colors.grey,
      this.onPressedColor = Colors.blue});

  @override
  State<SecondButtonWidget> createState() => _SecondButtonWidgetState();
}

class _SecondButtonWidgetState extends State<SecondButtonWidget> {
  Color? buttonColor = Colors.grey[200];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: buttonColor),
        onPressed: () {
          setState(() {
            // followBGColor =
            //     followBGColor == Colors.red ? Colors.grey[200] : Colors.red;

            if (buttonColor == widget.defaultColor) {
              buttonColor = widget.onPressedColor;
            } else {
              buttonColor = widget.defaultColor;
            }
          });
          dev.log("Second Color ${widget.defaultColor.toString()}");
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            'Follow',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
