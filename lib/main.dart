import 'package:Medwise/Components/taskListTile.dart';
import 'package:Medwise/screens/date.dart';
import 'package:Medwise/screens/task_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: TaskListTiles(),
    ));
  }
}
