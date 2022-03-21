import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/models/models.dart';
import 'package:seneca_aplicacion/providers/providers.dart';

class ServicioESAlumnosScreen extends StatefulWidget {
  const ServicioESAlumnosScreen({Key? key}) : super(key: key);

  @override
  State<ServicioESAlumnosScreen> createState() =>
      _ServicioESAlumnosScreenState();
}

class _ServicioESAlumnosScreenState extends State<ServicioESAlumnosScreen> {
  bool botonPulsado = true;
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
        title: Text("$nombreCurso"),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
              itemCount: listaAlumnos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    null;
                  },
                  child: ListTile(
                    title: Text(listaAlumnos[index].nombre,
                        style: TextStyle(fontSize: 20)),
                    subtitle: Row(
                      children: [
                        IconButton(
                          color: botonPulsado ? Colors.green : Colors.grey,
                          iconSize: 35,
                          alignment: Alignment.centerLeft,
                          icon: Icon(Icons.check_circle),
                          onPressed: () {
                            setState(() {
                              if (botonPulsado) botonPulsado = !botonPulsado;
                            });
                          },
                        ),
                        IconButton(
                          color: botonPulsado ? Colors.grey : Colors.red,
                          iconSize: 35,
                          alignment: Alignment.centerLeft,
                          icon: Icon(Icons.cancel),
                          onPressed: () {
                            setState(() {
                              if (!botonPulsado) botonPulsado = !botonPulsado;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
