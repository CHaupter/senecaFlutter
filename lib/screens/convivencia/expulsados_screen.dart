import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/models/models.dart';
import 'package:seneca_aplicacion/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpulsadosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expulsadosProvider = Provider.of<ConvivenciaProvider>(context);
    final listadoExpulsados = expulsadosProvider.listaExpulsados;
    final datosAlumnosProvider = Provider.of<AlumnadoProvider>(context);
    final listadoAlumnos = datosAlumnosProvider.listadoAlumnos;

    List<Expulsado> listadoExpulsadosHoy = [];
    List<DatosAlumnos> cogerDatosExpulsados = [];

    // DateTime now = DateTime.now();

    for (int i = 0; i < listadoExpulsados.length; i++) {
      //Líneas comentadas para desvincular fecha de contenido
      // print('Dentro del for');
      // final listaExpulsion = listadoExpulsados[i].fec_inic.split("-");
      // print(listaExpulsion);

      // if (int.parse(listaExpulsion[0]) == now.year &&
      //     int.parse(listaExpulsion[1]) == now.month &&
      //     int.parse(listaExpulsion[2]) == now.day) {

      //Sólo dejamos estas dos líneas para ver todo el contenido
      listadoExpulsadosHoy.add(listadoExpulsados[i]);
      listadoExpulsadosHoy.sort((a, b) => b.fec_fin.compareTo(a.fec_fin));

      //Líneas comentadas para desvincular fecha de contenido
      // print('Entra en el if');
      // print(listadoExpulsadosHoy);
      // }
    }

    for (int i = 0; i < listadoExpulsadosHoy.length; i++) {
      for (int j = 0; j < listadoAlumnos.length; j++) {
        if (listadoExpulsadosHoy[i].apellidosNombre ==
            listadoAlumnos[j].nombre) {
          listadoAlumnos[j].email;
          listadoAlumnos[j].telefonoAlumno;
          listadoAlumnos[j].telefonoMadre;
          listadoAlumnos[j].telefonoPadre;

          cogerDatosExpulsados.add(listadoAlumnos[j]);
        }
      }
    }

    // for (int j = 0; j < cogerDatosExpulsados.length; j++) {
    //   print(cogerDatosExpulsados[j].email);
    //   print(cogerDatosExpulsados[j].telefonoAlumno);
    //   print(cogerDatosExpulsados[j].telefonoMadre);
    //   print(cogerDatosExpulsados[j].telefonoPadre);
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Expulsados'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: listadoExpulsadosHoy.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _mostrarAlert(context, index, listadoExpulsadosHoy,
                      cogerDatosExpulsados);
                },
                child: ListTile(
                  title: Text(listadoExpulsadosHoy[index].apellidosNombre),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(listadoExpulsadosHoy[index].fec_inic),
                      Text(" - "),
                      Text(listadoExpulsadosHoy[index].fec_fin),
                    ],
                  ),
                  subtitle: Text(listadoExpulsadosHoy[index].curso),
                ),
              );
            }),
      ),
    );
  }

  void _mostrarAlert(
      BuildContext context,
      int index,
      List<Expulsado> listadoExpulsadosHoy,
      List<DatosAlumnos> cogerDatosExpulsados) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold);

          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text("${listadoExpulsadosHoy[index].apellidosNombre}"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Text(
                      "Correo: ",
                      style: textStyle,
                    ),
                    Text("${cogerDatosExpulsados[index].email}"),
                    IconButton(
                        onPressed: () {
                          launch("mailto:${cogerDatosExpulsados[index].email}");
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
                    Text("${cogerDatosExpulsados[index].telefonoAlumno}"),
                    IconButton(
                        onPressed: () {
                          launch(
                              "tel:${cogerDatosExpulsados[index].telefonoAlumno}");
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
                    Text("${cogerDatosExpulsados[index].telefonoMadre}"),
                    IconButton(
                        onPressed: () {
                          launch(
                              "tel:${cogerDatosExpulsados[index].telefonoMadre}");
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
                    Text("${cogerDatosExpulsados[index].telefonoPadre}"),
                    IconButton(
                        onPressed: () {
                          launch(
                              "tel:${cogerDatosExpulsados[index].telefonoPadre}");
                        },
                        icon: Icon(Icons.phone),
                        color: Colors.blue),
                  ],
                ),
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
