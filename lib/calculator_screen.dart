import 'package:calculator/calculator_button.dart';
import 'package:calculator/constraints.dart';
import 'package:calculator/setting.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String equation = '';
  String result = '';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        equation = "";
        result = "";
      } else if (buttonText == "=") {
        try {
          String finalresult = equation;
          finalresult = equation.replaceAll('x', "*");
          Parser p = Parser();
          Expression exp = p.parse(finalresult);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "";
        }
      } else if (buttonText == "!") {
        if (equation.isNotEmpty) {
          equation = equation.substring(0, equation.length - 1);
        }
      } else if (buttonText == "+/-") {
        if (equation.startsWith("-")) {
          equation = equation.substring(1);
        } else {
          equation = "-$equation";
        }
      } else {
        equation += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Settings();
                        }));
                      },
                      icon: Icon(Icons.settings),iconSize: 30,),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                equation,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 20, right: 8),
              child: Text(
                result,
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: kthemeColor(
                        context: context,
                        lightmode: Colors.grey.shade100,
                        darkmode: Colors.grey.shade800),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                padding: EdgeInsets.only(top: 25),
                child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: buttonlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 15,
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      final buttontext = buttonlist[index];
                      return CalculatorButton(
                          buttonText: buttontext, onpressed: buttonPressed);
                    }),
              ),
            )
          ],
        ),
    );
  }
}
