import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/models/alumnos_response.dart';
import 'package:seneca_aplicacion/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactoDetallesAlumnadoScreen extends StatelessWidget {
  const ContactoDetallesAlumnadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alumnadoProvider = Provider.of<AlumnadoProvider>(context);
    final listadoAlumnos = alumnadoProvider.listadoAlumnos;
    final nombreCurso = ModalRoute.of(context)!.settings.arguments;

    List<DatosAlumnos> listaAlumnos = [];

    for (int i = 0; i < listadoAlumnos.length; i++) {
      if (listadoAlumnos[i].curso == nombreCurso) {
        listaAlumnos.add(listadoAlumnos[i]);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("CONTACTO"),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
              itemCount: listaAlumnos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _mostrarAlert(context, index, listaAlumnos);
                  },
                  child: ListTile(
                    title: Text(listaAlumnos[index].nombre),
                  ),
                );
              }),
        ),
      ),
    );
  }

  void _mostrarAlert(
      BuildContext context, int index, List<DatosAlumnos> listaAlumnos) {
    int numeroTlfAlumno = int.parse(listaAlumnos[0].telefonoAlumno);
    int numeroTlfPadre = int.parse(listaAlumnos[0].telefonoPadre);
    int numeroTlfMadre = int.parse(listaAlumnos[0].telefonoMadre);

    String mailAlumno = listaAlumnos[0].email;

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text("${listaAlumnos[index].nombre}"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    "Correo: $mailAlumno \n\nTeléfono: $numeroTlfAlumno \nTeléfono Padre: $numeroTlfPadre \nTeléfono Madre: $numeroTlfMadre"),
                Text(" "),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          launch("mailto: $mailAlumno");
                        },
                        icon: Icon(Icons.mail)),
                    IconButton(
                        onPressed: () {
                          launch("tel:$numeroTlfAlumno");
                        },
                        icon: Icon(Icons.phone)),
                    IconButton(
                        onPressed: () {
                          launch("tel:$numeroTlfPadre");
                        },
                        icon: Icon(Icons.male_rounded)),
                    IconButton(
                        onPressed: () {
                          launch("tel:$numeroTlfMadre");
                        },
                        icon: Icon(Icons.female_rounded))
                  ],
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cerrar")),
            ],
          );
        });
  }
}
