// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class CredencialesResponse {
  CredencialesResponse({
    required this.results,
  });

  List<Credenciales> results;

  factory CredencialesResponse.fromJson(String str) =>
      CredencialesResponse.fromMap(json.decode(str));

  factory CredencialesResponse.fromMap(Map<String, dynamic> json) =>
      CredencialesResponse(
        results: List<Credenciales>.from(
            json["results"].map((x) => Credenciales.fromMap(x))),
      );
}

class Credenciales {
  Credenciales({
    required this.id,
    required this.usuario,
    required this.pass,
  });

  String id;
  String usuario;
  String pass;

  factory Credenciales.fromJson(dynamic str) =>
      Credenciales.fromMap(json.decode(str));

  factory Credenciales.fromMap(Map<String, dynamic> json) => Credenciales(
        id: json["ID"],
        usuario: json["Usuario"],
        pass: json["Pass"],
      );
}
