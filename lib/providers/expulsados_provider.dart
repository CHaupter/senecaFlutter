import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_aplicacion/models/models.dart';

class ProviderExpulsadosResponse extends ChangeNotifier {
  String _idHoja = '1YNtm8Aqdz0Gth_xJN7QZffE8_U3CcWj1gM2wCwFwlHQ';
  String _baseUrl = 'opensheet.vercel.app';
  String _nombreHoja = 'expulsados';

  List<Expulsado> listaExpulsados = [];

  ProviderExpulsadosResponse() {
    print('Expulsados Response inicializada');

    this.getExpulsados();
  }

  Future<String> _getJsonData() async {
    final url = Uri.https(_baseUrl, _idHoja + "/" + _nombreHoja);
    final response = await http.get(url);
    return response.body;
  }

  getExpulsados() async {
    String jsonData = await this._getJsonData();
    jsonData = '{"results":' + jsonData + '}';
    final expulsadoResponse = ExpulsadosResponse.fromJson(jsonData);
    listaExpulsados = [...expulsadoResponse.results];

    notifyListeners();
  }
}
