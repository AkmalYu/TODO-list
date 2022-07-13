import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddTask(),
    );
  }
}

class AddTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddTask();
  }
}

class _AddTask extends State<StatefulWidget> {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
  List<Widget> _cardList = [];
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (_, mode, __) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: 20, right: 20, bottom: 20),
              // отступы за пределами контейнера
              child: Container(
                padding:
                    EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
                //отступы внутри контейнера
                decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 0), // changes pogsition of shadow
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
                        ButtonTheme(
                          minWidth: 20,
                          height: 40,
                          child: MaterialButton(
                            onPressed: () => _notifier.value =
                                mode == ThemeMode.light
                                    ? ThemeMode.dark
                                    : ThemeMode.light,
                            child: Icon(
                              CupertinoIcons.eye,
                              size: 30,
                            ),
                          ),
                        ),
                        ButtonTheme(
                          minWidth: 15,
                          height: 40,
                          child: MaterialButton(
                            onPressed: _addCardWidget,
                            color: Color(0xFFFFFFF),
                            child: Icon(
                              CupertinoIcons.add,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Color(0xFFEBEBEB),
                      thickness: 1,
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _cardList.length,
                          itemBuilder: (context, index) {
                            return _cardList[index];
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _addCardWidget() {
    setState(() {
      _cardList.add(_card());
    });
  }

  bool _isChecked = true;

  Widget _card() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (String value) {

            },
          ),
        ),
      ],
    );
  }
}
