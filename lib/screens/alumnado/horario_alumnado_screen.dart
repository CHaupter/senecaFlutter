import 'package:flutter/material.dart';

class HorarioAlumnadoScreen extends StatelessWidget {
  const HorarioAlumnadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CONTACTO ALUMNOS"),
      ),
      /*body: Center(
        child: Container(
          child: ListView.builder(
              itemCount: listadoProfesores.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return GestureDetector(
                      onTap: () {
                        null;
                      },
                      child: Container());
                } else {
                  return GestureDetector(
                    onTap: () {
                      _mostrarAlert(context, index, listadoProfesores);
                    },
                    child: ListTile(
                      title: Text(listadoProfesores[index].nombre),
                    ),
                  );
                }
              }),
        ),
      ),*/
    );
  }
}
