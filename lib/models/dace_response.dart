import 'dart:convert';

class DaceResponse {
  DaceResponse({
    required this.results,
  });

  List<ResultDace> results;

  factory DaceResponse.fromJson(String str) =>
      DaceResponse.fromMap(json.decode(str));

  factory DaceResponse.fromMap(Map<String, dynamic> json) => DaceResponse(
        results: List<ResultDace>.from(
            json["results"].map((x) => ResultDace.fromMap(x))),
      );
}

class ResultDace {
  ResultDace({
    required this.id,
    required this.actividad,
    required this.fechaInicio,
    required this.fechaFin,
    required this.alumnos,
  });

  String id;
  String actividad;
  String fechaInicio;
  String fechaFin;
  String alumnos;

  factory ResultDace.fromJson(String str) =>
      ResultDace.fromMap(json.decode(str));

  factory ResultDace.fromMap(Map<String, dynamic> json) => ResultDace(
        id: json["ID"],
        actividad: json["ACTIVIDAD"],
        fechaInicio: json["FECHA INICIO"],
        fechaFin: json["FECHA FIN"],
        alumnos: json["ALUMNOS"],
      );
}
