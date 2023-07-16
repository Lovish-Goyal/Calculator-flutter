import 'package:flutter/material.dart';

Color kthemeColor(
    {required BuildContext context,
    required Color lightmode,
    required Color darkmode}) {
  return Theme.of(context).brightness == Brightness.dark ? darkmode : lightmode;
}

final buttonlist = [
  'AC',
  '+/-',
  '%',
  '/',
  '7',
  '8',
  '9',
  'x',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '00',
  '0',
  '.',
  '=',
];
