import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:calculator/constraints.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ThemeSwitcher(builder: (context) {
          return ToggleSwitch(
            minWidth: 100,
            minHeight: 100,
            totalSwitches: 2,
            iconSize: 40,
            cornerRadius: 20,
            animate: true,
            activeFgColor: kthemeColor(
                context: context,
                lightmode: Colors.grey.shade800,
                darkmode: Colors.grey.shade300),
            activeBgColor: [
              kthemeColor(
                  context: context,
                  lightmode: Colors.grey.shade100,
                  darkmode: Colors.grey.shade600),
            ],
            inactiveBgColor: kthemeColor(
                context: context,
                lightmode: Colors.grey.shade100,
                darkmode: Colors.grey.shade600),
            inactiveFgColor: kthemeColor(
                context: context,
                lightmode: Colors.grey.shade400,
                darkmode: Colors.white),
            icons: const [Icons.light_mode_outlined, Icons.dark_mode_outlined],
            onToggle: (index) {
              var brightness =
                  ThemeModelInheritedNotifier.of(context).theme.brightness;
              ThemeSwitcher.of(context).changeTheme(
                theme: brightness == Brightness.light
                    ? ThemeData.dark()
                    : ThemeData.light(),
              );
              // isReversed: brightness == Brightness.dark ? true : false);
            },
          );
        }),
      ),
    );
  }
}
