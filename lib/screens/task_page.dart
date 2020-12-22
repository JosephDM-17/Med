import 'package:Medwise/Components/taskListTile.dart';
import 'package:Medwise/screens/date.dart';
import 'package:flutter/material.dart';

class TaskListTiles extends StatefulWidget {
  @override
  _TaskListTilesState createState() => _TaskListTilesState();
}

//The main task page
class _TaskListTilesState extends State<TaskListTiles> {
  List titles = [
    "Take medicines",
    "Checkup",
    "Exercise",
    "Call Doctor",
    "nnnnnnnnnnn",
    "m",
    "bsbhh"
  ];
  List descriptions = [
    "a.a..a.a",
    "b.........",
    "c......",
    ".....fdfg",
    "popo",
    "wueuey",
    "jjdhj"
  ];
  List timefield = [
    "8.00 pm",
    "12.00 pm",
    "10.00 pm",
    "11.00 am",
    "8.00 pm",
    "12.00 pm",
    "10.00 pm",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(10),
          child: Container(
            child: Column(children: [
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: CalendarTile(),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Date(
                                title: 'Calendar',
                              )));
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            //to delete tiles
                            Dismissible(
                              key: Key(titles[index]),
                              background: slideRightBackground(),
                              secondaryBackground: slideLeftBackground(),
                              confirmDismiss: (direction) async {
                                if (direction == DismissDirection.endToStart) {
                                  final bool res = await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Text(
                                              "Are you sure you want to delete ${titles[index]}?"),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            FlatButton(
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              onPressed: () {
                                                // TODO: Delete the item from DB etc..
                                                setState(() {
                                                  titles.removeAt(index);
                                                  descriptions.removeAt(index);
                                                  timefield.removeAt(index);
                                                });
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                  return res;
                                } else {}
                              },
                              //for displaying each tile
                              child: Column(
                                children: [
                                  TaskListTile(
                                    title: titles[index],
                                    description: descriptions[index],
                                    time: timefield[index],
                                  ),
                                  Divider(
                                    color: Colors.black12,
                                    height: 20,
                                    thickness: 2,
                                    indent: 25,
                                    endIndent: 10,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ]),
          )),
      floatingActionButton: customFAB(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//add button at the bottom
customFAB(BuildContext context) {
  return GestureDetector(
    onTap: null,
    child: Container(
      child: Icon(
        Icons.add,
        size: 30,
        color: Colors.white,
      ),
      height: 40,
      width: 40,
      margin: EdgeInsets.only(bottom: 10),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.blue, boxShadow: [
        BoxShadow(
          color: Colors.grey[200],
          blurRadius: 38,
          offset: Offset(0, 5),
        )
      ]),
    ),
  );
}

//to edit by sliding right
Widget slideRightBackground() {
  return Container(
    color: Colors.green,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text(
            " Edit",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}

//to delete by sliding left
Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
}
