import 'package:flutter/material.dart';

class HorarioProfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String nombre = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HORARIO DE $nombre",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
          child: Table(
        children: [
          TableRow(children: [
            Container(),
            Container(child: Text("L")),
            Container(child: Text("M")),
            Container(child: Text("X")),
            Container(child: Text("J")),
            Container(child: Text("V")),
          ]),
          TableRow(children: [
            Container(),
            Container(child: Text("L")),
            Container(child: Text("M")),
            Container(child: Text("X")),
            Container(child: Text("J")),
            Container(child: Text("V")),
          ]),
          TableRow(children: [
            Container(),
            Container(child: Text("L")),
            Container(child: Text("M")),
            Container(child: Text("X")),
            Container(child: Text("J")),
            Container(child: Text("V")),
          ]),
          TableRow(children: [
            Container(),
            Container(child: Text("L")),
            Container(child: Text("M")),
            Container(child: Text("X")),
            Container(child: Text("J")),
            Container(child: Text("V")),
          ]),
          TableRow(children: [
            Container(),
            Container(child: Text("L")),
            Container(child: Text("M")),
            Container(child: Text("X")),
            Container(child: Text("J")),
            Container(child: Text("V")),
          ]),
        ],
      )),
    );
  }
}
