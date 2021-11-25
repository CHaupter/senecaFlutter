import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_aplicacion/models/credenciales.dart';

class CredencialesProvider extends ChangeNotifier {
  String _baseUrl = "opensheet.vercel.app";
  String _idHoja = "1KVKM_G5JBeCqvp0NNag84C6rv5xDZJvASjx7zG67LxI";
  String _nombreHoja = "Hoja+1";

  List<Credenciales> listaCredenciales = [];

  CredencialesProvider() {
    print("Inicializado Cred Provider");

    this.getCredencialesUsuario();
  }

  Future<String> _getJsonData() async {
    final url = Uri.http(_baseUrl, _idHoja + "/" + _nombreHoja);

    final response = await http.get(url);
    return response.body;
  }

  getCredencialesUsuario() async {
    String respuesta = await _getJsonData();
    respuesta = '{"results":' + respuesta + "}";
    //respuesta = respuesta.substring(1, respuesta.length - 1);

    final credencialesResponse = CredencialesResponse.fromJson(respuesta);

    listaCredenciales = credencialesResponse.results;
    notifyListeners();
  }
}
