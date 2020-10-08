import 'package:flutter/material.dart';
import 'bmi.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.indigo[900],
      accentColor: Colors.indigo[900],
      primaryTextTheme: TextTheme(

      ),
    ),
    home:  InputBMI(),
  )

);

