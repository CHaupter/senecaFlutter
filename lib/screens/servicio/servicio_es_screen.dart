import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/providers/providers.dart';

class ServicioESScreen extends StatelessWidget {
  const ServicioESScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alumnadoProvider = Provider.of<AlumnadoProvider>(context);
    final listadoAlumnos = alumnadoProvider.listadoAlumnos;

    return Scaffold(
      appBar: AppBar(
        title: Text("CURSOS"),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
              itemCount: listadoAlumnos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "servicio_es_alumnos_screen",
                        arguments: listadoAlumnos[index].curso);
                  },
                  child: ListTile(
                    title: Text(listadoAlumnos[index].curso),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
