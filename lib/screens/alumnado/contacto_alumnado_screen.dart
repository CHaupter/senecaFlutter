import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/providers/providers.dart';

class ContactoAlumnadoScreen extends StatelessWidget {
  const ContactoAlumnadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alumnadoProvider = Provider.of<AlumnadoProvider>(context);
    final listadoAlumnos = alumnadoProvider.listadoAlumnos;

    return Scaffold(
      appBar: AppBar(
        title: Text("CONTACTO ALUMNOS"),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
              itemCount: listadoAlumnos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    String nombreCurso = listadoAlumnos[index].curso;
                    Navigator.pushNamed(
                        context, "contacto_detalles_alumnado_screen",
                        arguments: nombreCurso);
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
