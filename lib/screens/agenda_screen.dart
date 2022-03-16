import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALENDARIO"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          child: SfCalendar(
            view: CalendarView.day,
          ),
        ),
      ),
    );
  }
}
