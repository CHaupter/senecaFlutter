import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_aplicacion/models/credenciales_response.dart';

class CredencialesProvider extends ChangeNotifier {
  //Script Google
  //https://script.google.com/macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec?spreadsheetId=1R5sbb2HgMyp6SGBgVQEODuGDXj7_fDOcMVuxfvvB2SU&sheet=Credenciales

  //Google Docs Credenciales
  //https://docs.google.com/spreadsheets/d/1R5sbb2HgMyp6SGBgVQEODuGDXj7_fDOcMVuxfvvB2SU/edit#gid=0

  String _url = "script.google.com";
  String _api =
      "macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec";
  String _idHoja = "1R5sbb2HgMyp6SGBgVQEODuGDXj7_fDOcMVuxfvvB2SU";
  String _nombreHoja = "Credenciales";

  List<Credenciales> listaCredenciales = [];

  CredencialesProvider() {
    print("Credenciales Provider inicializado");

    this.getCredencialesUsuario();
  }

  Future<String> _getJsonData(
      String baseurl, String api, String pagina, String hoja) async {
    final url =
        Uri.https(baseurl, api, {"spreadsheetId": "$pagina", "sheet": "$hoja"});

    final response = await http.get(url);

    return response.body;
  }

  getCredencialesUsuario() async {
    String respuesta = await _getJsonData(_url, _api, _idHoja, _nombreHoja);
    respuesta = '{"results":' + respuesta + "}";

    final credencialesResponse = CredencialesResponse.fromJson(respuesta);

    listaCredenciales = credencialesResponse.results;
    notifyListeners();
  }
}
