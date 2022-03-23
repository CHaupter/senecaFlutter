import 'dart:convert';

class ServicioResponse {
  ServicioResponse({
    required this.result,
  });

  List<Servicio> result;

  factory ServicioResponse.fromJson(String str) =>
      ServicioResponse.fromMap(json.decode(str));

  factory ServicioResponse.fromMap(Map<String, dynamic> json) =>
      ServicioResponse(
        result: List<Servicio>.from(
            json["results"].map((x) => Servicio.fromMap(x))),
      );
}

class Servicio {
  Servicio({
    required this.nombreAlumno,
    required this.fechaEntrada,
    required this.fechaSalida,
  });

  String nombreAlumno;
  String fechaEntrada;
  String fechaSalida;

  factory Servicio.fromJson(String str) => Servicio.fromMap(json.decode(str));

  factory Servicio.fromMap(Map<String, dynamic> json) => Servicio(
        nombreAlumno: json["NombreAlumno"],
        fechaEntrada: json["FechaEntrada"],
        fechaSalida: json["FechaSalida"],
      );
}
