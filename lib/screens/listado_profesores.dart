import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/providers/centro_provider.dart';

class ListadoProfesores extends StatelessWidget {
  const ListadoProfesores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final centroProvider = Provider.of<CentroProvider>(context);
    final listadoProfesores = centroProvider.listaProfesores;

    return Scaffold(
      appBar: AppBar(
        title: Text("LISTA PROFESORES"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: listadoProfesores.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _mostrarAlert(context, index);
                },
                child: ListTile(
                  title: Text(listadoProfesores[index].nombre),
                ),
              );
            }),
      ),
    );
  }
}

List<String> _averiguarHorario(BuildContext context, int tramo, int id_prof) {
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
}

int _averiguarTramo(BuildContext context) {
  final centroProvider = Provider.of<CentroProvider>(context, listen: false);
  final listadoTramos = centroProvider.listaTramos;

  List<String> splitHoraInicio = [];
  List<String> splitHoraFinal = [];
  DateTime now = DateTime.now();

  int tramo = 0;

  for (int i = 0; i < listadoTramos.length; i++) {
    splitHoraInicio = (listadoTramos[i].horaInicio.split(":"));
    splitHoraFinal = (listadoTramos[i].horaFinal.split(":"));

    if (int.parse(splitHoraInicio[0]) * 60 + int.parse(splitHoraInicio[1]) <=
            (now.minute + now.hour * 60) &&
        (now.minute + now.hour * 60) <
            int.parse(splitHoraFinal[0]) * 60 + int.parse(splitHoraFinal[1]) &&
        int.parse(listadoTramos[i].numeroDia) == 1) {
      tramo = int.parse(listadoTramos[i].numTr);
      print("Número de tramo: $tramo");
    }
  }

  return tramo;
}

void _mostrarAlert(BuildContext context, int index) {
  final centroProvider = Provider.of<CentroProvider>(context, listen: false);
  final listadoProfesores = centroProvider.listaProfesores;
  final listadoTramos = centroProvider.listaTramos;
  final listadoAsignaturas = centroProvider.listaAsignaturas;
  final listadoAulas = centroProvider.listaAulas;

  int tramo = _averiguarTramo(context);
  List<String> horario = _averiguarHorario(context, index, tramo);
  String horaInicio = "";
  String horaFinal = "";
  DateTime now = DateTime.now();
  String asignatura = "";
  String aula = "";

  for (int i = 0; i < listadoAsignaturas.length; i++) {
    if (int.parse(listadoAsignaturas[i].numIntAs) == int.parse(horario[0])) {
      asignatura = listadoAsignaturas[i].nombre[0];
    }
  }

  print(asignatura);
  for (int i = 0; i < listadoAulas.length; i++) {
    if (int.parse(listadoAulas[i].numIntAu) == int.parse(horario[1])) {
      print("ids aula iguales");
      aula = listadoAulas[i].nombre;
    }
  }
  print(aula);

  for (int i = 0; i < listadoTramos.length; i++) {
    if (int.parse(listadoTramos[i].numTr) == tramo &&
        int.parse(listadoTramos[i].numeroDia) == now.weekday) {
      horaInicio = listadoTramos[i].horaInicio;
      horaFinal = listadoTramos[i].horaFinal;
    }
  }

  if (!horario.isEmpty) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text("${listadoProfesores[index].nombre}"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    "Se encuentra en el aula $aula impartiendo la asignatura $asignatura, de $horaInicio a $horaFinal"),
                Text(" "),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text("OK")),
            ],
          );
        });
  } else {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text("${listadoProfesores[index].nombre}"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("No se encuentra en clase actualmente"),
                Text(" "),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text("OK")),
            ],
          );
        });
  }
}
