import 'package:flutter/material.dart';

class HorarioScreen extends StatelessWidget {
  const HorarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HORARIO"),
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ListTile();
        }),
      ),
    );
  }
}
