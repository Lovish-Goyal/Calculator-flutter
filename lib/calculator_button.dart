import 'package:calculator/constraints.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {super.key, required this.buttonText, required this.onpressed});
  final String buttonText;
  final Function(String) onpressed;

  @override
  Widget build(BuildContext context) {
    final operators = ['/', 'x', '-', '+', '='];
    final controllers = ['AC','+/-','%'];
    return GestureDetector(
      onTap: () => onpressed(buttonText),
      child: Container(
        alignment: Alignment.center,
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kthemeColor(
              context: context,
              lightmode: Colors.grey.shade200,
              darkmode: Colors.grey.shade700),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: operators.contains(buttonText)
            ? Color(0xffec6666)
            : controllers.contains(buttonText)
            ?Color(0xff26fed6)
            :Theme.of(context).textTheme.bodyLarge!.color,
            fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
