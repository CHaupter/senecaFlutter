import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_aplicacion/models/models.dart';

class AlumnadoProvider extends ChangeNotifier {
  List<DatosAlumnos> listadoAlumnos = [];
  List<HorarioResult> listadoHorarios = [];

  //Prueba Google Script ejecutado
  //https://script.google.com/macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec?spreadsheetId=14nffuLY-WILXuAQFMUWNEZIYK08WxI0g1_aK73Ths9Q&sheet=Datos_Alumnado

  //hoja excel
  //https://docs.google.com/spreadsheets/d/14nffuLY-WILXuAQFMUWNEZIYK08WxI0g1_aK73Ths9Q/edit#gid=0

  final _url = "script.google.com";
  final _api =
      "macros/s/AKfycbz6i2aqeJs4ui5qUHoHzRSUhsEOfnpcy_rQ1wmJFAOVYjL4FoX7Qb6u8ePBci8HoWo5qQ/exec";
  final _idHoja = "14nffuLY-WILXuAQFMUWNEZIYK08WxI0g1_aK73Ths9Q";
  final _hojaCursos = "Cursos";

  final _hojaAlumnos = "Datos_Alumnado";

  final _hojaHorario = "Horarios";

  AlumnadoProvider() {
    print("Alumnado Provider inicalizado");
    getAlumno();
    getHorario();
  }

  Future<String> _getJsonData(
      String baseurl, String api, String pagina, String hoja) async {
    final url =
        Uri.https(baseurl, api, {"spreadsheetId": "$pagina", "sheet": "$hoja"});

    final response = await http.get(url);

    return response.body;
  }

  Future<List<String>> getCursos() async {
    String jsonData = await this._getJsonData(_url, _api, _idHoja, _hojaCursos);
    jsonData = '{"results":' + jsonData + '}';
    final cursosResponse = CursosResponse.fromJson(jsonData);
    List<String> nombres = [];

    for (int i = 0; i < cursosResponse.result.length; i++) {
      nombres.add(cursosResponse.result[i].cursoNombre);
    }
    return nombres;
  }

  Future<List<dynamic>> getAlumnos(String cursoABuscarAlumnos) async {
    String jsonData =
        await this._getJsonData(_url, _api, _idHoja, _hojaAlumnos);
    jsonData = '{"results":' + jsonData + '}';
    final cursosResponse = AlumnosResponse.fromJson(jsonData);
    List<dynamic> nombresAlumnos = [];
    for (int i = 0; i < cursosResponse.result.length; i++) {
      if (cursosResponse.result[i].curso == cursoABuscarAlumnos)
        nombresAlumnos.add(cursosResponse.result[i].nombre);
    }
    return nombresAlumnos;
  }

  getAlumno() async {
    String jsonData =
        await this._getJsonData(_url, _api, _idHoja, _hojaAlumnos);
    jsonData = '{"results":' + jsonData + '}';
    final cursosResponse = AlumnosResponse.fromJson(jsonData);
    listadoAlumnos = cursosResponse.result;
    notifyListeners();
  }

  getHorario() async {
    String jsonData =
        await this._getJsonData(_url, _api, _idHoja, _hojaHorario);
    jsonData = '{"results":' + jsonData + '}';
    final cursosResponse = HorarioResponse.fromJson(jsonData);
    listadoHorarios = cursosResponse.result;
    notifyListeners();
  }
}

final datos = new AlumnadoProvider();
