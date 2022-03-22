import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/models/models.dart';
import 'package:seneca_aplicacion/providers/providers.dart';
import 'package:intl/intl.dart';

class ServicioESAlumnosScreen extends StatefulWidget {
  const ServicioESAlumnosScreen({Key? key}) : super(key: key);

  @override
  State<ServicioESAlumnosScreen> createState() =>
      _ServicioESAlumnosScreenState();
}

class _ServicioESAlumnosScreenState extends State<ServicioESAlumnosScreen> {
  bool botonPulsado = true;
  String fechaFormatoEntrada = "";
  String fechaFormatoSalida = "";
  String nombreAlumno = "";

  final controllerTextoNombreAlumno = TextEditingController();
  final controllerTextoFechaEntrada = TextEditingController();
  final controllerTextoFechaSalida = TextEditingController();

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
                    controllerTextoNombreAlumno.text = "";
                    controllerTextoFechaEntrada.text = "";
                    controllerTextoFechaSalida.text = "";

                    String fechaEntrada = DateFormat("dd-MM-yyyy hh:mm")
                        .format(DateTime.now())
                        .toString();

                    showGeneralDialog(
                        context: context,
                        barrierDismissible: false,
                        transitionDuration: Duration(milliseconds: 1000),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          controllerTextoNombreAlumno.text =
                              listaAlumnos[index].nombre;

                          controllerTextoFechaEntrada.text =
                              DateFormat("dd-MM-yyyy hh:mm")
                                  .format(DateTime.now());
                          return DialogoBotones(
                              controllerTextoNombreAlumno,
                              controllerTextoFechaEntrada,
                              controllerTextoFechaSalida);
                        });
                  },
                  child: ListTile(
                    title: Text(listaAlumnos[index].nombre,
                        style: TextStyle(fontSize: 20)),
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget DialogoBotones(
      TextEditingController controllerTextoNombreAlumno,
      TextEditingController controllerTextoFechaEntrada,
      TextEditingController controllerTextoFechaSalida) {
    return Scaffold(
      appBar: AppBar(
          leading: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "CANCELAR",
                style: TextStyle(color: Colors.white),
              )),
          leadingWidth: 90,
          actions: [
            TextButton(
                onPressed: () {
                  //Logica documento
                  Navigator.pop(context);
                },
                child: Text(
                  "CONFIRMAR",
                  style: TextStyle(color: Colors.white),
                ))
          ]),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  TextField(
                    controller: controllerTextoNombreAlumno,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "NOMBRE ALUMNO",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    enabled: false,
                  ),
                  Divider(color: Colors.transparent),
                  TextField(
                    controller: controllerTextoFechaEntrada,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "FECHA ENTRADA",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    enabled: false,
                  ),
                  Divider(color: Colors.transparent),
                  TextField(
                    controller: controllerTextoFechaSalida,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                controllerTextoFechaSalida.text =
                                    DateFormat("dd-MM-yyyy hh:mm")
                                        .format(DateTime.now());
                              });
                            },
                            icon: Icon(
                              Icons.add_box_outlined,
                              size: 30,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "FECHA SALIDA",
                        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                    readOnly: true,
                  )
                ],
              ))),
    );
  }
}
