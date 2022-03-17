// To parse this JSON data, do
//
//     final alumnos = alumnosFromMap(jsonString);

import 'dart:convert';

class AlumnosResponse {
  AlumnosResponse({
    required this.result,
  });

  List<DatosAlumnos> result;

  factory AlumnosResponse.fromJson(String str) =>
      AlumnosResponse.fromMap(json.decode(str));

  factory AlumnosResponse.fromMap(Map<String, dynamic> json) => AlumnosResponse(
        result: List<DatosAlumnos>.from(
            json["results"].map((x) => DatosAlumnos.fromMap(x))),
      );
}

class DatosAlumnos {
  DatosAlumnos({
    required this.nombre,
    required this.curso,
    required this.email,
    required this.telefonoAlumno,
    required this.telefonoPadre,
    required this.telefonoMadre,
  });

  String nombre;
  String curso;
  String email;
  String telefonoAlumno;
  String telefonoPadre;
  String telefonoMadre;

  factory DatosAlumnos.fromJson(String str) =>
      DatosAlumnos.fromMap(json.decode(str));

  factory DatosAlumnos.fromMap(Map<String, dynamic> json) => DatosAlumnos(
        nombre: json["nombre"],
        curso: json["curso"],
        email: json["email"],
        telefonoAlumno: json["telefonoAlumno"],
        telefonoPadre: json["telefonoPadre"],
        telefonoMadre: json["telefonoMadre"],
      );
}
