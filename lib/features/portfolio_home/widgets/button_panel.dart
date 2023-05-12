import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        SecondButtonWidget(
          defaultColor: Colors.blue[900] as Color,
          onPressedColor: Colors.blue,
          buttonText: 'Hire Me',
          disableColoronTap: true,
        ),
        const SizedBox(width: kIsWeb ? 30 : 10),
        // Expanded(
        //   child: profileButton(
        //       // defaultButtonColor: Colors.grey[200] as Color,
        //       textColor: Colors.black,
        //       child: const Text(
        //         'Follow',
        //         style: TextStyle(color: Colors.black),
        //       )),
        // ),
        const SecondButtonWidget(
            defaultColor: Colors.grey,
            onPressedColor: Colors.pink,
            buttonText: 'Follow'),
      ],
    );
  }

//   ElevatedButton profileButton(
//       {Color defaultButtonColor = const Color(0xffe4d4d4),
//       Color onPressedColor = Colors.blue,
//       required Color textColor,
//       required Widget child}) {
//     Color? buttonColor;
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           // fixedSize: Size(200, 40),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           backgroundColor: buttonColor),
//       onPressed: () {
//         setState(() {
//           if (buttonColor == defaultButtonColor) {
//             buttonColor = onPressedColor;
//           } else {
//             buttonColor = defaultButtonColor;
//           }
//         });
//       },
//       child: child,
//     );
//   }
}

class SecondButtonWidget extends StatefulWidget {
  final Color defaultColor;
  final Color onPressedColor;
  final String buttonText;
  final bool disableColoronTap;
  const SecondButtonWidget(
      {super.key,
      required this.defaultColor,
      this.onPressedColor = Colors.blue,
      required this.buttonText,
      this.disableColoronTap = false});

  @override
  State<SecondButtonWidget> createState() => _SecondButtonWidgetState();
}

class _SecondButtonWidgetState extends State<SecondButtonWidget> {
  Color? buttonColor;
  @override
  void initState() {
    buttonColor = widget.defaultColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(80, 60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: buttonColor),
            onPressed: () {
              setState(() {
                // followBGColor =
                //     followBGColor == Colors.red ? Colors.grey[200] : Colors.red;

                if (buttonColor == widget.defaultColor &&
                    !widget.disableColoronTap) {
                  buttonColor = widget.onPressedColor;
                } else {
                  buttonColor = widget.defaultColor;
                }
              });
              dev.log("Second Color ${widget.defaultColor.toString()}");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                widget.buttonText,
                style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          )
        : Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: buttonColor),
              onPressed: () {
                setState(() {
                  // followBGColor =
                  //     followBGColor == Colors.red ? Colors.grey[200] : Colors.red;

                  if (buttonColor == widget.defaultColor &&
                      !widget.disableColoronTap) {
                    buttonColor = widget.onPressedColor;
                  } else {
                    buttonColor = widget.defaultColor;
                  }
                });
                dev.log("Second Color ${widget.defaultColor.toString()}");
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  widget.buttonText,
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          );
  }
}
