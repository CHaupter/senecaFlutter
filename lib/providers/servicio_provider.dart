import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_aplicacion/models/servicio_response.dart';

class ServicioProvider extends ChangeNotifier {
  List<Servicio> listadoAlumnosServicio = [];

  //Google Script Lectura ejecutado
  //https://script.google.com/macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec?spreadsheetId=1Jq4ihUzE5r4fqK9HHZQv1dg4AAgzdjPbGkpJRByu-Ds&sheet=Servicio

  //Google Script Escritura
  //https://script.google.com/macros/s/AKfycbz7ZwCTn2XXpXuPO2-m9tyR1sIC9lOMgvPPOsbDehda2NRoko871PvZvzF1jQnaq8Du/exec?spreadsheetId=1Jq4ihUzE5r4fqK9HHZQv1dg4AAgzdjPbGkpJRByu-Ds&sheet=Servicio&nombreAlumno=Alumno2&fechaEntrada=fecha2&fechaSalida=fecha2

  //Google Docs Baño
  //https://docs.google.com/spreadsheets/d/1Jq4ihUzE5r4fqK9HHZQv1dg4AAgzdjPbGkpJRByu-Ds/edit#gid=0

  final _url = "script.google.com";
  final _apiLectura =
      "macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec";

  final _apiEscritura =
      "macros/s/AKfycbz7ZwCTn2XXpXuPO2-m9tyR1sIC9lOMgvPPOsbDehda2NRoko871PvZvzF1jQnaq8Du/exec";
  final _idHoja = "1Jq4ihUzE5r4fqK9HHZQv1dg4AAgzdjPbGkpJRByu-Ds";
  final _hojaCursos = "Servicio";

  ServicioProvider() {
    print("Servicio Provider inicializado");
    this.getAlumnosServicio();

    notifyListeners();
  }

  Future<String> _getJsonData(
      String baseurl, String api, String pagina, String hoja) async {
    final url =
        Uri.https(baseurl, api, {"spreadsheetId": "$pagina", "sheet": "$hoja"});

    final response = await http.get(url);

    return response.body;
  }

  getAlumnosServicio() async {
    String jsonData =
        await this._getJsonData(_url, _apiLectura, _idHoja, _hojaCursos);
    jsonData = '{"results":' + jsonData + '}';
    final servicioResponse = ServicioResponse.fromJson(jsonData);

    listadoAlumnosServicio = servicioResponse.result;
    notifyListeners();
  }

  _setAlumnos(String baseurl, String api, String pagina, String hoja,
      String nombre, String fechaEntrada, String fechaSalida) async {
    final url = Uri.https(baseurl, api, {
      "spreadsheetId": "$pagina",
      "sheet": "$hoja",
      "nombreAlumno": "$nombre",
      "fechaEntrada": "$fechaEntrada",
      "fechaSalida": "$fechaSalida"
    });

    await http.get(url);
  }

  setAlumnosServicio(
      String nombreAlumno, String fechaEntrada, String fechaSalida) {
    this._setAlumnos(_url, _apiEscritura, _idHoja, _hojaCursos, nombreAlumno,
        fechaEntrada, fechaSalida);

    notifyListeners();
  }
}

final servicio = new ServicioProvider();
