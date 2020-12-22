import 'package:flutter/material.dart';

class TaskListTile extends StatefulWidget {
  String title, description, time;
  TaskListTile({this.title, this.description, this.time});

  @override
  _TaskListTileState createState() => _TaskListTileState();
}

final double diameter = 30;
bool done = false;

class _TaskListTileState extends State<TaskListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 26),
      padding: EdgeInsets.fromLTRB(24, 16, 0, 20),
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          boxShadow: [
            new BoxShadow(
                color: Colors.grey, blurRadius: 16.0, offset: Offset(0, 3.0)),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: AnimatedOpacity(
              opacity: !done ? 1 : 0.4,
              duration: Duration(milliseconds: 200),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3.5,
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 6.5,
                  ),
                  Text(
                    widget.time,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          FlatButton(
              onPressed: () {
                setState(() {
                  done = !done;
                });
              },
              child: done ? circleDone() : circleNotDone()),
        ],
      ),
    );
  }

  circleNotDone() {
    return Container(
      height: diameter,
      width: diameter,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.blue,
            width: 2,
          )),
    );
  }

  circleDone() {
    return Container(
      height: diameter,
      width: diameter,
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: Image.asset('assets/images/tick.png'),
    );
  }
}
