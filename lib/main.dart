import 'package:flutter/material.dart';

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,

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
                color: Color(0xFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes pogsition of shadow
                  ),
                ],
                border: Border.all(
                  width: 0.5,
                  color: Color(0xFFFFFFFF),
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
