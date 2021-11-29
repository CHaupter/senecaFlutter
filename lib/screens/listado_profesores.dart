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
    final listadoHorariosProfesores = centroProvider.listaHorariosProfesores;

    int id_aula = 0;
    String tramoInicio = "";
    String tramoFinal = "";
    String nombreAula = "";
    DateTime now = DateTime.now();

    int cont = 0;
    int dia = 5;
    int hora;
    int minuto;
    int numeroTramo = 0;
    List<String> horaInicio;
    List<String> horaFinal;
    List<String> splitHoraInicio;
    List<String> splitHoraFinal;
    bool tramoEncontrado = false;

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
                  splitHoraInicio = [];
                  splitHoraFinal = [];

                  for (int i = 0; i < listadoTramos.length; i++) {
                    splitHoraInicio = (listadoTramos[i].horaInicio.split(":"));
                    splitHoraFinal = (listadoTramos[i].horaFinal.split(":"));

                    print("\nHora inicio: " +
                        splitHoraInicio[0] +
                        ":" +
                        splitHoraInicio[1] +
                        "\nHora actual: ${now.hour}:${now.minute}" +
                        "\nHora final: " +
                        splitHoraFinal[0] +
                        ":" +
                        splitHoraFinal[1]);

                    if (now.hour < int.parse(splitHoraFinal[0])) {
                      numeroTramo = int.parse(listadoTramos[i].numTr);
                      print("Número de tramo: $numeroTramo");
                    }
                  }
                  /*_mostrarInformacion(
                      context, index, listadoHorariosProfesores, listadoTramos);*/
                },
                child: ListTile(
                  title: Text(listadoProfesores[index].nombre),
                ),
              );
            }),
      ),
    );
  }

  _mostrarInformacion(BuildContext context, int index,
      List<HorarioProf> listadoHorariosProfesores, List<Tramo> listadoTramos) {
    //Averiguo el numero de Tramo comparando con la hora actual

    //Averiguo el horarioProf, comparando si el num_int_pr es igual a hor_num_int_pr
    //Si es igual, saco el que tenga el mismo Tramo
  }
}
