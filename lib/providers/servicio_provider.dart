import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_aplicacion/models/servicio_response.dart';

class ServicioProvider extends ChangeNotifier {
  List<Servicio> listadoAlumnosServicio = [];

  //Prueba Google Script ejecutado
  //https://script.google.com/macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec?spreadsheetId=1Jq4ihUzE5r4fqK9HHZQv1dg4AAgzdjPbGkpJRByu-Ds&sheet=Servicio

  //Google Docs Baño
  //https://docs.google.com/spreadsheets/d/1Jq4ihUzE5r4fqK9HHZQv1dg4AAgzdjPbGkpJRByu-Ds/edit#gid=0

  final _url = "script.google.com";
  final _api =
      "macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec";
  final _idHoja = "1Jq4ihUzE5r4fqK9HHZQv1dg4AAgzdjPbGkpJRByu-Ds";
  final _hojaCursos = "Servicio";

  ServicioProvider() {
    print("Servicio Provider inicalizado");
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
    String jsonData = await this._getJsonData(_url, _api, _idHoja, _hojaCursos);
    jsonData = '{"results":' + jsonData + '}';
    final servicioResponse = ServicioResponse.fromJson(jsonData);

    listadoAlumnosServicio = servicioResponse.result;
    notifyListeners();
  }
}

final servicio = new ServicioProvider();
