import 'package:azlistview/azlistview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/providers/providers.dart';

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

    List<String> nombresAlumnos = [];
    int longitud = listadoAlumnos.length;

    for (int i = 0; i < longitud; i++) {
      nombresAlumnos.add(listadoAlumnos[i].nombre);
    }

    return Container(
        child: AzListView(
      data: [],
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            null;
          },
          child: ListTile(
            title: Text(listadoAlumnos[index].nombre),
          ),
        );
      },
      itemCount: longitud,
    ));
  }
}
