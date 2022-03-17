// To parse this JSON data, do
//
//     final logear = logearFromMap(jsonString);

import 'dart:convert';

class CursosResponse {
  CursosResponse({
    required this.result,
  });

  List<Curso> result;

  factory CursosResponse.fromJson(String str) =>
      CursosResponse.fromMap(json.decode(str));

  factory CursosResponse.fromMap(Map<String, dynamic> json) => CursosResponse(
        result: List<Curso>.from(json["results"].map((x) => Curso.fromMap(x))),
      );
}

class Curso {
  Curso({
    required this.id,
    required this.cursoNombre,
  });

  String id;
  String cursoNombre;

  factory Curso.fromJson(String str) => Curso.fromMap(json.decode(str));

  factory Curso.fromMap(Map<String, dynamic> json) => Curso(
        id: json["Id"],
        cursoNombre: json["Curso"],
      );
}
