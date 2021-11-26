import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seneca_aplicacion/models/centro.dart';

class CentroProvider extends ChangeNotifier {
  List<Profesor> listaProfesores = [];
  List<HorarioProf> listaHorariosProfesores = [];
  List<Tramo> listaTramos = [];

  CentroProvider() {
    print("Inicializado Centro Provider");

    this.getDatosCentro();
  }

  Future<String> _getJsonData() async {
    return rootBundle.loadString('assets/horario.json');
  }

  getDatosCentro() async {
    final respuesta = await _getJsonData();
    final centroResponse = CentroResponse.fromJson(respuesta);

    listaProfesores = centroResponse.centro.datos.profesores.profesor;
    listaHorariosProfesores =
        centroResponse.centro.horarios.horariosProfesores.horarioProf;
    listaTramos = centroResponse.centro.datos.tramosHorarios.tramo;

    notifyListeners();
  }
}
