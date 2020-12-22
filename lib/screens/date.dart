import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

class Date extends StatefulWidget {
  Date({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DateState createState() => new _DateState();
}

class _DateState extends State<Date> {
  DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime(2020, 8, 3);

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );
//Can later be used to create events in the calendar
  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2020, 8, 5): [
        new Event(
          date: new DateTime(2020, 8, 5),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.green,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2020, 8, 5),
          title: 'Event 2',
          icon: _eventIcon,
        ),
      ],
    },
  );

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

  @override
  void initState() {
    _markedDateMap.addAll(new DateTime(2020, 12, 11), [
      new Event(
        date: new DateTime(2020, 12, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 12, 10),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 12, 12),
        title: 'Event 3',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 12, 10),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }

//Calendar carousel
  @override
  Widget build(BuildContext context) {
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: true,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),

      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),

      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //custom icon
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarousel,
              ), // This trailing comma makes auto-formatting nicer for build methods.
              //custom icon without header
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _currentMonth,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    )),
                    FlatButton(
                      child: Text('PREV'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month - 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    ),
                    FlatButton(
                      child: Text('NEXT'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month + 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ), //
            ],
          ),
        ));
  }
}

//CalendarTile- to display the date and month
class CalendarTile extends StatelessWidget {
  DateTime _currentDate = DateTime.now();
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  static final DateFormat formattrial = DateFormat('dd');
  String date = formattrial.format(now);
  String dateFormat = DateFormat('dd-MM-yyyy hh:mm').format(now);

  @override
  Widget build(BuildContext context) {
    print(DateFormat('EEEE, d MMM, yyyy').format(now));

    return Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: TextStyle(fontSize: 46),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        (DateFormat("MMMM").format(now)).toUpperCase(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        DateFormat('EEEE').format(now),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
