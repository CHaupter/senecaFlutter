import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seneca_aplicacion/widgets/lista_opciones.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundPaginas(),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text("Agenda",
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                              fontFamily: 'ErasDemi')),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: SfCalendar(
                      view: CalendarView.month,
                    ),
                  ),
                ],
              ),
            ),
            ListaOpciones()
          ],
        ),
      ),
    );
  }
}

class BackgroundPaginas extends StatelessWidget {
  const BackgroundPaginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xFF02569d),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
