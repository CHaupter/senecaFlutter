import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_aplicacion/models/models.dart';

class DaceProvider extends ChangeNotifier {
  List<ResultDace> resultados = [];

  DaceProvider() {
    print("DaceProvider inicializado");
    this.getDaceData();
  }

  Future<String> _getJsonData() async {
    final url = Uri.parse(
        'https://opensheet.vercel.app/149zzcYE1utXnOeawKTjh2p7bFuPNNb8nL3xcXVInRcg/3');

    // Await the http get response, then decode the json-formatted respo
    final response = await http.get(url);

    return response.body;
  }

  getDaceData() async {
    final jsonData = await this._getJsonData();

    final daceData = DaceResponse.fromJson('{"results":' + jsonData + '}');

    resultados = daceData.results;
    //print(resultados);
    notifyListeners();
  }
}
