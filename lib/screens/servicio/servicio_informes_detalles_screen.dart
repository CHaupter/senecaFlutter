import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/models/models.dart';
import 'package:seneca_aplicacion/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicioInformesDetallesScreen extends StatelessWidget {
  const ServicioInformesDetallesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nombreParametro = ModalRoute.of(context)!.settings.arguments;
    final servicioProvider = Provider.of<ServicioProvider>(context);
    final alumnadoProvider = Provider.of<AlumnadoProvider>(context);
    final listaAlumnos = alumnadoProvider.listadoAlumnos;
    List<DatosAlumnos> alumno = [];

    for (int i = 0; i < listaAlumnos.length; i++) {
      if (listaAlumnos[i].nombre == nombreParametro) {
        alumno.add(listaAlumnos[i]);
      }
    }
    final listadoAlumnosDetalles = servicioProvider.listadoAlumnosServicio;

    List<String> fechas = [];

    for (int i = 0; i < listadoAlumnosDetalles.length; i++) {
      if (listadoAlumnosDetalles[i].nombreAlumno == nombreParametro) {
        fechas.add(
            "${listadoAlumnosDetalles[i].fechaEntrada} - ${listadoAlumnosDetalles[i].fechaSalida}");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${nombreParametro.toString().toUpperCase()}"),
      ),
      body: SafeArea(
        child: Stack(children: [
          Container(
            child: ListView.builder(
              itemCount: fechas.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${fechas[index]}"),
                );
              },
            ),
          ),
          Container(
              padding: EdgeInsets.only(right: 20, bottom: 20),
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  onPressed: () => _mostrarAlert(context, alumno),
                  child: Icon(Icons.person)))
        ]),
      ),
    );
  }

  void _mostrarAlert(BuildContext context, List<DatosAlumnos> alumno) {
    int numeroTlfAlumno = int.parse(alumno[0].telefonoAlumno);
    int numeroTlfPadre = int.parse(alumno[0].telefonoPadre);
    int numeroTlfMadre = int.parse(alumno[0].telefonoMadre);

    String mailAlumno = alumno[0].email;

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold);

          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text("${alumno[0].nombre}"),
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
