import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF1E1F25),
);

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          // отступы за пределами контейнера
          child: Container(
            padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
            //отступы внутри контейнера
            decoration: BoxDecoration(
                color: Color(0xFF1E1F25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 0), // changes pogsition of shadow
                  ),
                ],
                border: Border.all(
                  width: 0.1,
                  color: Color(0xFFEBEBEB),
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tasks",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFFFFF),
                        // padding: EdgeInsets.only(left: 5, right: 1),
                        fixedSize: Size(30, 30),
                      ),
                      child: Icon(
                        CupertinoIcons.add,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 30,
                  color: Color(0xFFEBEBEB),
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
