import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_aplicacion/models/models.dart';

class DaceProvider extends ChangeNotifier {
  //Script Google
  //https://script.google.com/macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec?spreadsheetId=1WJ8tEOaDFHsqtWhgdUuZqRnfGQNzDnBiaqbQrDCTQto&sheet=Credenciales

  //Google Docs DACE
  //https://docs.google.com/spreadsheets/d/1WJ8tEOaDFHsqtWhgdUuZqRnfGQNzDnBiaqbQrDCTQto/edit#gid=0

  String _url = "script.google.com";
  String _api =
      "macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec";
  String _idHoja = "1WJ8tEOaDFHsqtWhgdUuZqRnfGQNzDnBiaqbQrDCTQto";
  String _nombreHoja = "DACE";
  List<ResultDace> resultados = [];

  DaceProvider() {
    print("DACE Provider inicializado");
    this.getDaceData();
    notifyListeners();
  }

  Future<String> _getJsonData(
      String baseurl, String api, String pagina, String hoja) async {
    final url =
        Uri.https(baseurl, api, {"spreadsheetId": "$pagina", "sheet": "$hoja"});

    final response = await http.get(url);

    return response.body;
  }

  getDaceData() async {
    final jsonData = await this._getJsonData(_url, _api, _idHoja, _nombreHoja);

    final daceData = DaceResponse.fromJson('{"results":' + jsonData + '}');

    resultados = daceData.results;
    notifyListeners();
  }
}
