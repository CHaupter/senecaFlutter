import 'dart:convert';

class HorarioResponse {
  HorarioResponse({
    required this.result,
  });

  List<HorarioResult> result;

  factory HorarioResponse.fromJson(String str) =>
      HorarioResponse.fromMap(json.decode(str));

  factory HorarioResponse.fromMap(Map<String, dynamic> json) => HorarioResponse(
        result: List<HorarioResult>.from(
            json["results"].map((x) => HorarioResult.fromMap(x))),
      );
}

class HorarioResult {
  HorarioResult({
    required this.curso,
    required this.dia,
    required this.hora,
    required this.asignatura,
    required this.aulas,
  });

  String curso;
  String dia;
  String hora;
  String asignatura;
  String aulas;

  factory HorarioResult.fromJson(String str) =>
      HorarioResult.fromMap(json.decode(str));

  factory HorarioResult.fromMap(Map<String, dynamic> json) => HorarioResult(
        curso: json["Curso"],
        dia: json["Dia"],
        hora: json["Hora"],
        asignatura: json["Asignatura"],
        aulas: json["Aulas"],
      );
}
