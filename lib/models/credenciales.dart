// To parse this JSON data, do
//
//     final credencialesResponse = credencialesResponseFromMap(jsonString);

import 'dart:convert';

class Credenciales {
  Credenciales({
    required this.id,
    required this.usuario,
    required this.pass,
  });

  String? id;
  String? usuario;
  String? pass;

  getIdUsuario() {
    return this.id;
  }

  getNombreUsuario() {
    return this.usuario;
  }

  getPassUsuario() {
    return this.pass;
  }

  factory Credenciales.fromJson(String str) =>
      Credenciales.fromMap(json.decode(str));

  factory Credenciales.fromMap(Map<String, dynamic> json) => Credenciales(
        id: json["ID"],
        usuario: json["Usuario"],
        pass: json["Pass"],
      );
}
