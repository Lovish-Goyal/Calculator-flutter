import 'package:calculator/calculator_screen.dart';
import 'package:flutter/material.dart';

import 'theme_switch.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CalculatorScreen();
                }));
              },
              icon: Icon(Icons.arrow_back),
              iconSize: 30,
            ),
            SizedBox(
              width: 130,
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Text(
                "Theme",
                style: TextStyle(fontSize: 35),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
        ),
        ThemeToggleSwitch(),
      ],
    ));
  }
}
