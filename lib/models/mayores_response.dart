import 'dart:convert';

class MayoresResponse {
  MayoresResponse({
    required this.results,
  });

  List<Mayor> results;

  factory MayoresResponse.fromJson(String str) =>
      MayoresResponse.fromMap(json.decode(str));

  factory MayoresResponse.fromMap(Map<String, dynamic> json) => MayoresResponse(
        results: List<Mayor>.from(json["results"].map((x) => Mayor.fromMap(x))),
      );
}

class Mayor {
  Mayor({
    required this.idAlumno,
    required this.apellidosNombre,
    required this.curso,
    required this.fec_inic,
    required this.fec_fin,
    required this.aula,
  });

  String idAlumno;
  String apellidosNombre;
  String curso;
  String fec_inic;
  String fec_fin;
  String aula;

  factory Mayor.fromJson(String str) => Mayor.fromMap(json.decode(str));

  factory Mayor.fromMap(Map<String, dynamic> json) => Mayor(
        idAlumno: json["id_alumno"],
        apellidosNombre: json["apellidos_nombre"],
        curso: json["curso"],
        fec_inic: json["fec_inic"],
        fec_fin: json["fec_fin"],
        aula: json["aula"],
      );
}
