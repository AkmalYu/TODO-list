import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() async {
  runApp(MyApp());
}

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
  late TextEditingController _controller;
  Map<String, bool?> values = {
  };

  _newTask(String text) {
    setState(
      () {
        tmp = text;
        _addMapTasks();
        initState();
      },
    );
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  @override
  void initState() {
    super.initState();
    _read();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Map<String, bool?>> _read() async {
    final path = await _localPath;
    final file = File('$path/task.txt');
    final jsonStr = await file.readAsString();
    return values = Map.castFrom(json.decode(jsonStr));

  }

  Future<void> _write(Map<String, bool?> map) async {
    final jsonStr = jsonEncode(map);
    final path = await _localPath;
    final file = File('$path/task.txt');

    await file.writeAsString(jsonStr);
  }

  String tmp = "";
  var temp = false;

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
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Write new task"),
                                  onSubmitted: _newTask,
                                  onEditingComplete: () {
                                    Navigator.pop(context);
                                    initState();
                                  },
                                ),
                              ),
                            ),
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
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: values.keys.map((String key) {
                          return new CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: new Text(key),
                            value: values[key],
                            onChanged: (bool? value) {
                              setState(() {
                                values[key] = value;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _addMapTasks() {
    setState(() {
      values.addEntries([MapEntry(tmp, temp)]);
      _write(values);
    });
  }
}
