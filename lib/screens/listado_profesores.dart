import 'package:flutter/material.dart';

class ListadoProfesores extends StatelessWidget {
  const ListadoProfesores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LISTA PROFESORES"),
      ),
      body: Container(
          //child: ListView.builder(itemBuilder: itemBuilder),
          ),
    );
  }
}
