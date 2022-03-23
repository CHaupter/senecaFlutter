import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_aplicacion/models/models.dart';

class ConvivenciaProvider extends ChangeNotifier {
  //Script Google
  //https://script.google.com/macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec?spreadsheetId=19DRVWGaBUP8JlSWvD3EwiSrtd5L9GFJptV1BVnoddZk&sheet=Expulsados
  //Google Docs Convivencia

  String _url = 'script.google.com';
  String _api =
      "macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec";
  String _idHoja = '19DRVWGaBUP8JlSWvD3EwiSrtd5L9GFJptV1BVnoddZk';
  String _hojaExpulsados = "Expulsados";
  String _hojaMayores = "Mayores";

  List<Expulsado> listaExpulsados = [];
  List<Mayor> listaMayores = [];

  ConvivenciaProvider() {
    print('Convivencia Provider inicializada');

    this.getExpulsados();
    this.getMayores();
    notifyListeners();
  }

  Future<String> _getJsonData(
      String baseurl, String api, String pagina, String hoja) async {
    final url =
        Uri.https(baseurl, api, {"spreadsheetId": "$pagina", "sheet": "$hoja"});

    final response = await http.get(url);

    return response.body;
  }

  getExpulsados() async {
    String jsonData =
        await this._getJsonData(_url, _api, _idHoja, _hojaExpulsados);
    jsonData = '{"results":' + jsonData + '}';
    final expulsadoResponse = ExpulsadosResponse.fromJson(jsonData);
    listaExpulsados = [...expulsadoResponse.results];

    notifyListeners();
  }

  getMayores() async {
    String jsonData =
        await this._getJsonData(_url, _api, _idHoja, _hojaMayores);
    jsonData = '{"results":' + jsonData + '}';
    final mayorResponse = MayoresResponse.fromJson(jsonData);
    listaMayores = [...mayorResponse.results];

    notifyListeners();
  }
}
