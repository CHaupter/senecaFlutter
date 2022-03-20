import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/models.dart';

class LocalizacionAlumnadoScreen extends StatefulWidget {
  const LocalizacionAlumnadoScreen({Key? key}) : super(key: key);

  @override
  State<LocalizacionAlumnadoScreen> createState() =>
      _LocalizacionAlumnadoScreenState();
}

class _LocalizacionAlumnadoScreenState
    extends State<LocalizacionAlumnadoScreen> {
  @override
  Widget build(BuildContext context) {
    final alumnadoProvider = Provider.of<AlumnadoProvider>(context);
    final listadoAlumnos = alumnadoProvider.listadoAlumnos;
    final listadoHorarios = alumnadoProvider.listadoHorarios;

    List<String> nombreAlumnos = [];

    listadoAlumnos.sort(((a, b) => a.nombre.compareTo(b.nombre)));
    return Scaffold(
      appBar: AppBar(title: Text("LOCALIZACION ALUMNOS")),
      body: Container(
        child: ListView.builder(
            itemCount: listadoAlumnos.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    _mostrarAlert(
                        context, index, listadoAlumnos, listadoHorarios);
                  },
                  child: ListTile(
                    title: Text(listadoAlumnos[index].nombre),
                  ));
            }),
      ),
    );
  }

  void _mostrarAlert(BuildContext context, int index,
      List<DatosAlumnos> listaAlumnos, List<HorarioResult> listadoHorarios) {
    DateTime ahora = DateTime.now();

    List<HorarioResult> listadoHorarioCurso = [];
    for (int i = 0; i < listadoHorarios.length; i++) {
      if (listaAlumnos[index].curso == listadoHorarios[i].curso) {
        listadoHorarioCurso.add(listadoHorarios[i]);
      }
    }

    // for (int i = 0; i < listadoHorarioCurso.length; i++) {
    //   print(" Día $i: ${listadoHorarioCurso[i].dia}");
    // }

    int hora = ahora.hour;
    int dia = ahora.weekday;
    print(dia);

    String asignatura = "";
    String aula = "";
    String texto = "";

    List<HorarioResult> listadoHorarioCursoDia = [];
    for (int i = 0; i < 6; i++) {
      listadoHorarioCursoDia.add(listadoHorarioCurso[i + (6 * (dia - 1))]);
      print("Dias: ${listadoHorarioCurso[i].dia}");
    }

    for (int i = 0; i < listadoHorarioCursoDia.length; i++) {
      if (hora == int.parse(listadoHorarioCursoDia[i].hora.split(":")[0])) {
        asignatura = listadoHorarioCursoDia[i].asignatura;
        aula = listadoHorarioCursoDia[i].aulas;
      }
    }

    if (aula == "" || asignatura == "") {
      texto = "El alumno no está disponible en este momento";
    } else {
      texto =
          "El alumno ${listaAlumnos[index].nombre} se encuentra actualmente en el aula $aula, en la asignatura $asignatura";
    }

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text("${listaAlumnos[index].nombre}"),
            content: Text(texto),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cerrar")),
            ],
          );
        });
  }
}
