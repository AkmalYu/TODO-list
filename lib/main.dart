import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Color(0xFF000000),
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
          ),
        );
  }
}
