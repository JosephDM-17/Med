import 'package:flutter/material.dart';

import '../models/task.dart';
import './task_list.dart';
import './date.dart';
import './new_task.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final List<Task> _userTasks = [
    Task(
      title: 'Before Food Medicine',
      description: 'xyz..25',
      date: DateTime.now(),
      time: TimeOfDay.now(),
      tag: 'medicine',
      taskDone: false,
    ),
    Task(
      title: 'Evening Walk 2km',
      description: 'abcdefg',
      date: DateTime.now(),
      time: TimeOfDay.now(),
      tag: 'exercise',
      taskDone: false,
    ),
    Task(
      title: 'Evening Walk 2km',
      description: 'abcdefg',
      date: DateTime.now(),
      time: TimeOfDay.now(),
      tag: 'exercise',
      taskDone: false,
    ),
    Task(
      title: 'Evening Walk 2km',
      description: 'abcdefg',
      date: DateTime.now(),
      time: TimeOfDay.now(),
      tag: 'exercise',
      taskDone: false,
    ),
  ];

  void _addNewTask(String taskTitle, String taskDescription, DateTime taskDate,
      TimeOfDay taskTime, String taskTag) {
    final newTask = Task(
      title: taskTitle,
      description: taskDescription,
      date: taskDate,
      time: taskTime,
      tag: taskTag,
    );

    setState(() {
      _userTasks.add(newTask);
    });
  }

  // List<Task> get _sortUserTasks{
  //   return {
  //     _userTasks.sort(
  //       (a, b) => a.time.format(context).compareTo((b.time.format(context))));
  //   return _userTasks;
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Date(),
            Expanded(child: TaskList(_userTasks)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewTask(_addNewTask)),
          );
        },
      ),
    );
  }
}
