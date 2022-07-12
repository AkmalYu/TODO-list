import 'package:flutter/material.dart';

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF1E1F25),

);

ThemeData _lightTheme = ThemeData(

    brightness: Brightness.light,
    primaryColor: Colors.white,

);

bool _light = true;

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _light ? _lightTheme : _darkTheme,
      darkTheme: _darkTheme,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            // margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes pogsition of shadow
                  ),
                ],
                border: Border.all(
                  width: 0.01,
                  color: const Color(0xFFFFFFFF),
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Tasks",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
