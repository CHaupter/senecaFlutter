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

    int id_aula = 0;
    String tramoInicio = "";
    String tramoFinal = "";
    String nombreAula = "";

    int cont = 0;
    List<String> horaInicio;
    List<String> horaFinal;
    List<String> splitHoraInicio;
    List<String> splitHoraFinal;
    bool tramoEncontrado = false;

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
                  int tramo = _averiguarTramo(context);

                  List<String> horario =
                      _averiguarHorario(context, tramo, index);
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
  final centroProvider = Provider.of<CentroProvider>(context);
  final listadoHorariosProfesores = centroProvider.listaHorariosProfesores;
  List<String> horario = [];
  String asignatura = "";
  String aula = "";

  for (int i = 0; i < listadoHorariosProfesores.length; i++) {
    if (listadoHorariosProfesores[i].horNumIntPr == id_prof) {
      for (int j = 0; j < listadoHorariosProfesores[i].actividad.length; j++) {
        if (listadoHorariosProfesores[i].actividad[j].tramo == tramo) {
          asignatura = listadoHorariosProfesores[i].actividad[j].asignatura;
          aula = listadoHorariosProfesores[i].actividad[j].aula;
        }
      }
    }
  }

  horario.add(asignatura);
  horario.add(aula);

  return horario;
}

int _averiguarTramo(BuildContext context) {
  final centroProvider = Provider.of<CentroProvider>(context);
  final listadoTramos = centroProvider.listaTramos;

  List<String> splitHoraInicio = [];
  List<String> splitHoraFinal = [];
  DateTime now = DateTime.now();

  int tramo = 0;

  for (int i = 0; i < listadoTramos.length; i++) {
    splitHoraInicio = (listadoTramos[i].horaInicio.split(":"));
    splitHoraFinal = (listadoTramos[i].horaFinal.split(":"));

    print("\nHora inicio: " +
        splitHoraInicio[0] +
        ":" +
        splitHoraInicio[1] +
        "\nHora actual: ${now.hour}:${now.minute}" +
        "\nHora final: " +
        splitHoraFinal[0] +
        ":" +
        splitHoraFinal[1]);

    if (int.parse(splitHoraInicio[0]) * 60 + int.parse(splitHoraInicio[1]) <=
            now.minute + now.hour * 60 &&
        now.minute + now.hour * 60 <
            int.parse(splitHoraFinal[0]) * 60 + int.parse(splitHoraFinal[1])) {
      tramo = int.parse(listadoTramos[i].numTr);
      print("Número de tramo: $tramo");
    }
  }

  return tramo;
}

void _mostrarAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("Horario"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("No existe ninguna cuenta con esas credenciales"),
              FlutterLogo(size: 100.0),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("OK")),
          ],
        );
      });
}
