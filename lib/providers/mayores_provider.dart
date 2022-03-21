import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_aplicacion/models/models.dart';

class ProviderMayoresResponse extends ChangeNotifier {
  //JSON de Mayores
  //opensheet.vercel.app/1YNtm8Aqdz0Gth_xJN7QZffE8_U3CcWj1gM2wCwFwlHQ/mayores
  String _idHoja = '1YNtm8Aqdz0Gth_xJN7QZffE8_U3CcWj1gM2wCwFwlHQ';
  String _baseUrl = 'opensheet.vercel.app';
  String _nombreHoja = 'mayores';

  List<Mayor> listaMayores = [];

  ProviderMayoresResponse() {
    print('Mayores Response inicializada');

    this.getMayores();
  }

  Future<String> _getJsonData() async {
    final url = Uri.https(_baseUrl, _idHoja + "/" + _nombreHoja);
    final response = await http.get(url);
    return response.body;
  }

  getMayores() async {
    String jsonData = await this._getJsonData();
    jsonData = '{"results":' + jsonData + '}';
    final mayorResponse = MayoresResponse.fromJson(jsonData);
    listaMayores = [...mayorResponse.results];

    notifyListeners();
  }
}
