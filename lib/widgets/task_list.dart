import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> displayedTasks;

  TaskList(this.displayedTasks);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  var done = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return AnimatedOpacity(
              opacity: !done ? 1 : 0.4,
              duration: Duration(milliseconds: 200),
              child: Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.displayedTasks[index].title,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                widget.displayedTasks[index].description,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                widget.displayedTasks[index].time
                                    .format(context),
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                          icon: !done
                              ? Icon(
                                  Icons.lens_outlined,
                                  color: Theme.of(context).primaryColor,
                                )
                              : Icon(
                                  Icons.check_circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                          onPressed: () {
                            setState(() {
                              done = !done;
                            });
                          })
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: widget.displayedTasks.length,
        ),
      ),
    );
  }
}
