import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/models/centro.dart';
import 'package:seneca_aplicacion/providers/centro_provider.dart';

class ListadoProfesores extends StatelessWidget {
  const ListadoProfesores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final centroProvider = Provider.of<CentroProvider>(context);
    final listadoProfesores = centroProvider.listaProfesores;
    final listadoTramos = centroProvider.listaTramos;
    final listadoHorarios = centroProvider.listaHorariosProfesores;

    int id_aula = 0;
    String tramoInicio = "";
    String tramoFinal = "";
    String nombreAula = "";
    DateTime now = DateTime.now();

    DateTime fechaHora = DateTime.parse("hh:mm");

    int dia = now.weekday;
    int hora = now.hour;
    int minuto = now.minute;

    return Scaffold(
      appBar: AppBar(
        title: Text("LISTA PROFESORES"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: listadoProfesores.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  /*id_aula =
                      int.parse(listadoHorarios[index].actividad[index].aula);

                  _mostrarInformacion(context,
                      nombre: listadoProfesores[index].nombre,
                      tramos: listadoTramos,
                      horarios: listadoHorarios);*/

                  print("$dia,$hora, $minuto");
                },
                child: ListTile(
                  title: Text(listadoProfesores[index].nombre),
                ),
              );
            }),
      ),
    );
  }

  Future<void> _mostrarInformacion(BuildContext context, String nombre) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Horario de: '),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("" + nombre),
                Text('Aula: '),
                Text('De ' + " a "),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Salir'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
