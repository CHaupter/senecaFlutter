import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/models/centro.dart';
import 'package:seneca_aplicacion/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactoProfesoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final centroProvider = Provider.of<CentroProvider>(context);
    final listadoProfesores = centroProvider.listaProfesores;
    return Scaffold(
      appBar: AppBar(
        title: Text("CONTACTO"),
      ),
      body: Center(
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
      ),
    );
  }
}

void _mostrarAlert(
    BuildContext context, int index, List<Profesor> listadoProfesores) {
  final int numeroTlf = (new Random().nextInt(99999999) + 600000000);
  final String mailProfesor = "Correoejemplo@gmail.com";

  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("${listadoProfesores[index].nombre}"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Correo: $mailProfesor \nTeléfono: $numeroTlf"),
              Text(" "),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        launch("mailto: $mailProfesor");
                      },
                      icon: Icon(Icons.mail)),
                  IconButton(
                      onPressed: () {
                        launch("tel:$numeroTlf");
                      },
                      icon: Icon(Icons.phone))
                ],
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Cerrar")),
          ],
        );
      });
}

/*List<String> _averiguarHorario(BuildContext context, int tramo, int id_prof) {
  final centroProvider = Provider.of<CentroProvider>(context, listen: false);
  final listadoHorariosProfesores = centroProvider.listaHorariosProfesores;
  List<String> horario = [];

  for (int i = 0; i < listadoHorariosProfesores.length; i++) {
    if (int.parse(listadoHorariosProfesores[i].horNumIntPr) == id_prof) {
      print("id iguales");
      for (int j = 0; j < listadoHorariosProfesores[i].actividad.length; j++) {
        print("Tramo JSON: ${listadoHorariosProfesores[i].actividad[j].tramo}");
        print("Tramo: $tramo");

        if (int.parse(listadoHorariosProfesores[i].actividad[j].tramo) ==
            tramo) {
          print("bruh");
          horario.add(listadoHorariosProfesores[i].actividad[j].asignatura);

          horario.add(listadoHorariosProfesores[i].actividad[j].aula);

          print("Asignatura: " + horario[0]);
          print("Aula: " + horario[1]);
        }
      }
    }
  }

  return horario;
}*/
