import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_aplicacion/models/models.dart';

class AlumnadoProvider extends ChangeNotifier {
  List<DatosAlumnos> listadoAlumnos = [];
  List<HorarioResult> listadoHorarios = [];

  //hoja excel
  //https://docs.google.com/spreadsheets/d/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/edit#gid=0

  //https://opensheet.vercel.app/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/Cursos
  final _url = "opensheet.vercel.app";
  final _api = "1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg";
  final _hojaCursos = "Cursos";

  //https://opensheet.vercel.app/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/Datos_Alumnado
  final _hojaAlumnos = "Datos_Alumnado";

  //https://opensheet.vercel.app/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/horarios
  final _hojaHorario = "Horarios";

  AlumnadoProvider() {
    print("Alumnado Provider inicalizado");
    getAlumno();
    getHorario();
  }

  Future<String> _getJsonData(String baseurl, String api, String pagina) async {
    final url = Uri.https(baseurl, api + "/" + pagina);

    final response = await http.get(url);

    return response.body;
  }

  Future<List<String>> getCursos() async {
    String jsonData = await this._getJsonData(_url, _api, _hojaCursos);
    jsonData = '{"results":' + jsonData + '}';
    final cursosResponse = CursosResponse.fromJson(jsonData);
    List<String> nombres = [];

    for (int i = 0; i < cursosResponse.result.length; i++) {
      nombres.add(cursosResponse.result[i].cursoNombre);
    }
    return nombres;
  }

  Future<List<dynamic>> getAlumnos(String cursoABuscarAlumnos) async {
    String jsonData = await this._getJsonData(_url, _api, _hojaAlumnos);
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
    String jsonData = await this._getJsonData(_url, _api, _hojaAlumnos);
    jsonData = '{"results":' + jsonData + '}';
    final cursosResponse = AlumnosResponse.fromJson(jsonData);
    listadoAlumnos = cursosResponse.result;
    notifyListeners();
  }

  getHorario() async {
    String jsonData = await this._getJsonData(_url, _api, _hojaHorario);
    jsonData = '{"results":' + jsonData.substring(1, jsonData.length) + '}';
    final cursosResponse = HorarioResponse.fromJson(jsonData);
    listadoHorarios = cursosResponse.result;
    notifyListeners();
  }
}

final datos = new AlumnadoProvider();
