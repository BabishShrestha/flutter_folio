import 'package:flutter/material.dart';
import 'dart:developer' as dev;

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    //-> Do Research
    return MaterialApp(
      debugShowCheckedModeBanner: false, //-> Do research
      title: 'Calculator',
      theme: ThemeData(
          //-> do research
          primarySwatch: Colors.blue),
      home: const SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  Color? calculateButton = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Simple Calculator'),
      //   backgroundColor: calculateButton,
      // ),
      body: SafeArea(
        child: Container(
          margin:
              const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          const Text("CASIO",
                              style: TextStyle(
                                fontSize: 24,
                              )),
                          TextButton.icon(
                            onPressed: null,
                            icon: const Icon(Icons.sunny),
                            label: const Text(""),
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                        child: const Text("A Scientific Calculator"))
                  ]),
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: null,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "0000",
                      style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 110, 110, 110)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "0000",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 110, 110, 110)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height * 0.65,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      // color: Colors.amber,
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CalculatorButton(
                                btnColor: Colors.green,
                                btnText: "",
                                btnHeight: 40,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: CalculatorButton(
                                btnColor:
                                    const Color.fromARGB(255, 113, 105, 105),
                                btnText: "",
                                btnHeight: 40,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: CalculatorButton(
                                btnColor:
                                    const Color.fromARGB(255, 59, 59, 209),
                                btnText: "",
                                btnHeight: 40,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: CalculatorButton(
                                btnColor: Colors.yellow,
                                btnText: "",
                                btnHeight: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "1",
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "2",
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "3",
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "4",
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "5",
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "6",
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "7",
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "8",
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "9",
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "+",
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "0",
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "-",
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.white,
                                  btnText: "()",
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.red,
                                  txtColor: Colors.white,
                                  btnText: "Clear",
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.orange,
                                  txtColor: Colors.white,
                                  btnText: "Back",
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CalculatorButton(
                                btnColor: Colors.white,
                                btnText: "SQRT",
                                // btnWidth: 100,
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: CalculatorButton(
                                  btnColor: Colors.blue,
                                  txtColor: Colors.white,
                                  btnText: "=",
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Widget Created for the button
class CalculatorButton extends StatefulWidget {
  Color? btnColor;
  Color? txtColor;
  String? btnText;
  double? btnHeight;
  double? btnWidth;
  CalculatorButton(
      {super.key,
      this.btnColor,
      this.txtColor = Colors.black,
      this.btnText,
      this.btnHeight = 150,
      this.btnWidth = 100});

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.btnHeight,
        width: widget.btnWidth,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: widget.btnColor,
          ),
          onPressed: () {
            setState(() {
              if (widget.btnColor == Colors.red) {
                widget.btnColor = Colors.white;
                widget.txtColor = Colors.black;
              } else {
                widget.btnColor = Colors.red;
                widget.txtColor = Colors.white;
              }
            });
            dev.log("Second Color ${widget.btnColor.toString()}");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              widget.btnText!,
              style: TextStyle(
                color: widget.txtColor,
              ),
            ),
          ),
        ));
  }
}
