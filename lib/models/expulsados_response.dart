import 'dart:convert';

class ExpulsadosResponse {
  ExpulsadosResponse({
    required this.results,
  });

  List<Expulsado> results;

  factory ExpulsadosResponse.fromJson(String str) =>
      ExpulsadosResponse.fromMap(json.decode(str));

  factory ExpulsadosResponse.fromMap(Map<String, dynamic> json) =>
      ExpulsadosResponse(
        results: List<Expulsado>.from(
            json["results"].map((x) => Expulsado.fromMap(x))),
      );
}

class Expulsado {
  Expulsado({
    required this.idAlumno,
    required this.apellidosNombre,
    required this.curso,
    required this.fec_inic,
    required this.fec_fin,
  });

  String idAlumno;
  String apellidosNombre;
  String curso;
  String fec_inic;
  String fec_fin;

  factory Expulsado.fromJson(String str) => Expulsado.fromMap(json.decode(str));

  factory Expulsado.fromMap(Map<String, dynamic> json) => Expulsado(
        idAlumno: json["id_alumno"],
        apellidosNombre: json["apellidos_nombre"],
        curso: json["curso"],
        fec_inic: json["fec_inic"],
        fec_fin: json["fec_fin"],
      );
}
