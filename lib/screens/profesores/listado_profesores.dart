import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/models/centro.dart';
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
              if (index == 0) {
                return GestureDetector(
                    onTap: () {
                      null;
                    },
                    child: Container());
              } else {
                return GestureDetector(
                  onTap: () {
                    _mostrarLocalizacion(context, index);
                  },
                  child: ListTile(
                    title: Text(listadoProfesores[index].nombre),
                  ),
                );
              }
            }),
      ),
    );
  }
}

List<String> _averiguarHorario(BuildContext context, int id_prof, int tramo) {
  final centroProvider = Provider.of<CentroProvider>(context, listen: false);
  final listadoHorariosProfesores = centroProvider.listaHorariosProfesores;
  List<String> horario = List.filled(2, "0");

  for (int i = 0; i < listadoHorariosProfesores.length; i++) {
    if (int.parse(listadoHorariosProfesores[i].horNumIntPr) == id_prof + 1) {
      for (int j = 0; j < listadoHorariosProfesores[i].actividad.length; j++) {
        if (int.parse(listadoHorariosProfesores[i].actividad[j].tramo) ==
            tramo) {
          horario[0] = listadoHorariosProfesores[i].actividad[j].asignatura;

          horario[1] = listadoHorariosProfesores[i].actividad[j].aula;

          print("Asignatura: " + horario[0]);
          print("Aula: " + horario[1]);
        }
      }
    }
  }

  return horario;
}

int _averiguarTramo(
    BuildContext context, List<Tramo> listadoTramos, int index) {
  DateTime now = DateTime.now();
  print(now.weekday);

  List<String> splitHoraInicio = [];
  List<String> splitHoraFinal = [];
  List<int> tramosProhibidos = [5, 10, 25, 30, 45, 50, 65, 70, 85, 90];
  int tramo = 0;
  int tramoCorrecto = 0;

  for (int i = 0; i < listadoTramos.length; i++) {
    splitHoraInicio = (listadoTramos[i].horaInicio.split(":"));
    splitHoraFinal = (listadoTramos[i].horaFinal.split(":"));

    if (int.parse(splitHoraInicio[0]) * 60 + int.parse(splitHoraInicio[1]) <=
            (now.minute + now.hour * 60) &&
        (now.minute + now.hour * 60) <
            int.parse(splitHoraFinal[0]) * 60 + int.parse(splitHoraFinal[1]) &&
        int.parse(listadoTramos[i].numeroDia) == now.weekday) {
      tramo = int.parse(listadoTramos[i].numTr);
      print("Número de tramo: $tramo");
      if (tramosProhibidos.contains(tramo)) {
        return tramo - 1;
      } else {
        if (comprobarTramo(context, tramo, index)) {
          tramoCorrecto = tramo;
          print("Tramo correcto: $tramoCorrecto");
          return tramoCorrecto;
        }
      }
    }
  }
  return tramo;
}

bool comprobarTramo(BuildContext context, int tramo, int index) {
  final centroProvider = Provider.of<CentroProvider>(context, listen: false);
  final listadoHorarioProfesores = centroProvider.listaHorariosProfesores;
  bool tramoCorrecto = false;

  for (int i = 0;
      i < listadoHorarioProfesores[index - 1].actividad.length;
      i++) {
    if (int.parse(listadoHorarioProfesores[index - 1].actividad[i].tramo) ==
        tramo) {
      tramoCorrecto = true;
    }
  }

  return tramoCorrecto;
}

void _mostrarLocalizacion(BuildContext context, int index) {
  final centroProvider = Provider.of<CentroProvider>(context, listen: false);
  final listadoProfesores = centroProvider.listaProfesores;
  final listadoTramos = centroProvider.listaTramos;
  final listadoAsignaturas = centroProvider.listaAsignaturas;
  final listadoAulas = centroProvider.listaAulas;

  int tramo = _averiguarTramo(context, listadoTramos, index);

  print(" Tramo obtenido del método: $tramo");
  List<String> horario = _averiguarHorario(context, index, tramo);
  String horaInicio = "";
  String horaFinal = "";
  DateTime now = DateTime.now();
  String asignatura = "";
  String aula = "";

  for (int i = 0; i < listadoAsignaturas.length; i++) {
    if (int.parse(listadoAsignaturas[i].numIntAs) == int.parse(horario[0])) {
      asignatura = listadoAsignaturas[i].nombre;
    }
  }

  for (int i = 0; i < listadoAulas.length; i++) {
    if (int.parse(listadoAulas[i].numIntAu) == int.parse(horario[1])) {
      aula = listadoAulas[i].nombre;
    }
  }
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
                mostrarHorario(aula, asignatura, horaInicio, horaFinal)
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

Widget mostrarHorario(aula, asignatura, horaInicio, horaFinal) {
  if (aula == "" && asignatura == "") {
    return Text("No se encuentra disponible");
  }

  return Text(
      "Se encuentra en el aula $aula impartiendo la asignatura $asignatura, de $horaInicio a $horaFinal");
}
