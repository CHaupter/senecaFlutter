import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/providers/providers.dart';

final tramosHorarios = [
  [2, 22, 42, 62, 82],
  [4, 24, 44, 64, 84],
  [6, 26, 46, 66, 86],
  [7, 27, 47, 67, 87],
  [9, 29, 49, 69, 89],
  [12, 32, 52, 72, 92],
  [14, 34, 54, 74, 94]
];

List<String> horario = [
  "8:15 a 9:15",
  "9:15 a 10:15",
  "10:15 a 11:15",
  "11:15 a 11:45",
  "11:45 a 12:45",
  "12:45 a 13:45",
  "13:45 a 14:45"
];

class HorarioProfesoresDetallesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;
    final centroProvider = Provider.of<CentroProvider>(context, listen: false);
    final listadoProfesores = centroProvider.listaProfesores;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HORARIO DE ${listadoProfesores[index].nombre} ",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                child: Table(
                  border: TableBorder.all(style: BorderStyle.solid),
                  children: [
                    DiasSemana(),
                    //8:15-9:15
                    DiaHorario(
                        context, centroProvider, index, tramosHorarios[0], 0),
                    //9:15-10:15
                    DiaHorario(
                        context, centroProvider, index, tramosHorarios[1], 1),
                    //10:15-11:15
                    DiaHorario(
                        context, centroProvider, index, tramosHorarios[2], 2),
                    //11:15-11:45
                    DiaHorario(
                        context, centroProvider, index, tramosHorarios[3], 3),
                    //11:45-12:45
                    DiaHorario(
                        context, centroProvider, index, tramosHorarios[4], 4),
                    //12:45-13:45
                    DiaHorario(
                        context, centroProvider, index, tramosHorarios[5], 5),
                    //13:45-14:45
                    DiaHorario(
                        context, centroProvider, index, tramosHorarios[6], 6),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  TableRow DiasSemana() {
    return TableRow(children: [
      Container(),
      Container(child: Text("L", textAlign: TextAlign.center)),
      Container(child: Text("M", textAlign: TextAlign.center)),
      Container(child: Text("X", textAlign: TextAlign.center)),
      Container(child: Text("J", textAlign: TextAlign.center)),
      Container(child: Text("V", textAlign: TextAlign.center)),
    ]);
  }

  TableRow DiaHorario(BuildContext context, CentroProvider centroProvider,
      int index, List<int> tramosHorarios, int i) {
    return TableRow(decoration: BoxDecoration(color: Colors.white), children: [
      Container(
          color: Colors.blue,
          child: Text(
            horario[i],
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      devolverClase(context, centroProvider, index, tramosHorarios[0]),
      devolverClase(context, centroProvider, index, tramosHorarios[1]),
      devolverClase(context, centroProvider, index, tramosHorarios[2]),
      devolverClase(context, centroProvider, index, tramosHorarios[3]),
      devolverClase(context, centroProvider, index, tramosHorarios[4]),
    ]);
  }
}

Widget devolverClase(
    BuildContext context, CentroProvider centroProvider, int index, int hora) {
  final listadoAulas = centroProvider.listaAulas;
  final listadoAsignaturas = centroProvider.listaAsignaturas;
  List<String> nuestroHorario = _averiguarHorario(context, index, hora);

  String asignatura = "";
  String aula = "";

  for (int i = 0; i < listadoAulas.length; i++) {
    if (int.parse(nuestroHorario[1]) == int.parse(listadoAulas[i].numIntAu)) {
      aula = listadoAulas[i].abreviatura;
    }
  }

  for (int i = 0; i < listadoAsignaturas.length; i++) {
    if (int.parse(nuestroHorario[0]) ==
        int.parse(listadoAsignaturas[i].numIntAs)) {
      asignatura = listadoAsignaturas[i].abreviatura;
    }
  }

  return Container(
    child: Column(children: [
      Text(asignatura,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          )),
      Text(aula.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold))
    ]),
  );
}

List<String> _averiguarHorario(BuildContext context, int id_prof, int tramo) {
  final centroProvider = Provider.of<CentroProvider>(context, listen: false);
  final listadoHorariosProfesores = centroProvider.listaHorariosProfesores;
  List<String> horario = List.filled(2, "0");
  //print("Tramo que entra en el método de averiguar horario: $tramo");

  for (int i = 0; i < listadoHorariosProfesores.length; i++) {
    if (int.parse(listadoHorariosProfesores[i].horNumIntPr) == id_prof + 1) {
      for (int j = 0; j < listadoHorariosProfesores[i].actividad.length; j++) {
        if (int.parse(listadoHorariosProfesores[i].actividad[j].tramo) ==
            tramo) {
          horario[0] = listadoHorariosProfesores[i].actividad[j].asignatura;

          horario[1] = listadoHorariosProfesores[i].actividad[j].aula;

          // print("Asignatura: " + horario[0]);
          // print("Aula: " + horario[1]);
        }
      }
    }
  }

  return horario;
}
