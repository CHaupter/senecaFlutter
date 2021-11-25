import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seneca_aplicacion/models/centro.dart';

class CentroProvider extends ChangeNotifier {
  List<Centro> listaCentro = [];

  CentroProvider() {
    print("Inicializado Centro Provider");

    this.getDatosCentro();
  }

  Future<String> _getJsonData() async {
    return rootBundle.loadString('assets/horario.json');
  }

  getDatosCentro() async {
    String respuesta = await _getJsonData();
    print(respuesta);

    final centroResponse = CentroResponse.fromMap(respuesta.);

    //listaCentro = centroResponse.centro;
    notifyListeners();
  }
}
