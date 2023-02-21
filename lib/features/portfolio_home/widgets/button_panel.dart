import 'dart:developer' as dev;
import 'dart:math';

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
    dev.log("First Color: ${followBGColor.toString()}");
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Expanded(
        //   child: ProfileButton(
        //     buttonText: 'Hire Me',
        //     buttonColor: Colors.blue[900],
        //     textColor: Colors.white,
        //     child: null,
        //   ),
        // ),
        const SizedBox(width: 10),
        // Expanded(
        //   child: ProfileButton('Follow', Colors.grey[200], Colors.black),
        // ),
        SecondButtonWidget(
          followBGColor: Colors.grey[200],
        ),
        
      ],
    );
  }

  ElevatedButton ProfileButton(
      {Color? buttonColor, required Color textColor, required Widget child}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          // fixedSize: Size(200, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: buttonColor),
      onPressed: () {},
      child: child,
    );
  }
}

class SecondButtonWidget extends StatefulWidget {
  Color? followBGColor;
  SecondButtonWidget({super.key, this.followBGColor});

  @override
  State<SecondButtonWidget> createState() => _SecondButtonWidgetState();
}

class _SecondButtonWidgetState extends State<SecondButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: widget.followBGColor),
        onPressed: () {
          setState(() {
            // followBGColor =
            //     followBGColor == Colors.red ? Colors.grey[200] : Colors.red;

            if (widget.followBGColor == Colors.red) {
              widget.followBGColor = Colors.grey[200];
            } else {
              widget.followBGColor = Colors.red;
            }
          });
          dev.log("Second Color ${widget.followBGColor.toString()}");
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
