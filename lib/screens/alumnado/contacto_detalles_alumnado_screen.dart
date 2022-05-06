import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/models/alumnos_response.dart';
import 'package:seneca_aplicacion/providers/providers.dart';
import 'package:seneca_aplicacion/screens/interfaz/login_screen.dart';
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

    TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold);

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
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Text("Correo: ", style: textStyle),
                    Text("$mailAlumno"),
                    IconButton(
                        onPressed: () {
                          launch("mailto: $mailAlumno");
                        },
                        icon: Icon(Icons.mail),
                        color: Colors.blue),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Teléfono Alumno: ",
                      style: textStyle,
                    ),
                    Text("$numeroTlfAlumno"),
                    IconButton(
                        onPressed: () {
                          launch("tel:$numeroTlfAlumno");
                        },
                        icon: Icon(Icons.phone),
                        color: Colors.blue),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Teléfono Padre: ",
                      style: textStyle,
                    ),
                    Text("$numeroTlfPadre"),
                    IconButton(
                        onPressed: () {
                          launch("tel:$numeroTlfPadre");
                        },
                        icon: Icon(Icons.phone),
                        color: Colors.blue),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Teléfono Madre: ",
                      style: textStyle,
                    ),
                    Text("$numeroTlfMadre"),
                    IconButton(
                        onPressed: () {
                          launch("tel:$numeroTlfMadre");
                        },
                        icon: Icon(Icons.phone),
                        color: Colors.blue)
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
