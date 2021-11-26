// To parse this JSON data, do
//
//     final centroResponse = centroResponseFromMap(jsonString);

import 'dart:convert';

class CentroResponse {
  CentroResponse({
    required this.centro,
  });

  Centro centro;

  factory CentroResponse.fromJson(String str) =>
      CentroResponse.fromMap(json.decode(str));

  factory CentroResponse.fromMap(Map<String, dynamic> json) => CentroResponse(
        centro: Centro.fromMap(json["CENTRO"]),
      );
}

class Centro {
  Centro({
    required this.datos,
    required this.horarios,
    required this.nombreCentro,
    required this.autor,
    required this.fecha,
  });

  Datos datos;
  Horarios horarios;
  String nombreCentro;
  String autor;
  String fecha;

  factory Centro.fromJson(String str) => Centro.fromMap(json.decode(str));

  factory Centro.fromMap(Map<String, dynamic> json) => Centro(
        datos: Datos.fromMap(json["DATOS"]),
        horarios: Horarios.fromMap(json["HORARIOS"]),
        nombreCentro: json["_nombre_centro"],
        autor: json["_autor"],
        fecha: json["_fecha"],
      );
}

class Datos {
  Datos({
    required this.asignaturas,
    required this.grupos,
    required this.aulas,
    required this.profesores,
    required this.tramosHorarios,
  });

  Asignaturas asignaturas;
  Grupos grupos;
  Aulas aulas;
  Profesores profesores;
  TramosHorarios tramosHorarios;

  factory Datos.fromJson(String str) => Datos.fromMap(json.decode(str));

  factory Datos.fromMap(Map<String, dynamic> json) => Datos(
        asignaturas: Asignaturas.fromMap(json["ASIGNATURAS"]),
        grupos: Grupos.fromMap(json["GRUPOS"]),
        aulas: Aulas.fromMap(json["AULAS"]),
        profesores: Profesores.fromMap(json["PROFESORES"]),
        tramosHorarios: TramosHorarios.fromMap(json["TRAMOS_HORARIOS"]),
      );
}

class Asignaturas {
  Asignaturas({
    required this.asignatura,
    required this.totAs,
  });

  List<Asignatura> asignatura;
  String totAs;

  factory Asignaturas.fromJson(String str) =>
      Asignaturas.fromMap(json.decode(str));

  factory Asignaturas.fromMap(Map<String, dynamic> json) => Asignaturas(
        asignatura: List<Asignatura>.from(
            json["ASIGNATURA"].map((x) => Asignatura.fromMap(x))),
        totAs: json["_tot_as"],
      );
}

class Asignatura {
  Asignatura({
    required this.numIntAs,
    required this.abreviatura,
    required this.nombre,
  });

  String numIntAs;
  String abreviatura;
  String nombre;

  factory Asignatura.fromJson(String str) =>
      Asignatura.fromMap(json.decode(str));

  factory Asignatura.fromMap(Map<String, dynamic> json) => Asignatura(
        numIntAs: json["_num_int_as"],
        abreviatura: json["_abreviatura"],
        nombre: json["_nombre"],
      );
}

class Aulas {
  Aulas({
    required this.aula,
    required this.totAu,
  });

  List<Aula> aula;
  String totAu;

  factory Aulas.fromJson(String str) => Aulas.fromMap(json.decode(str));

  factory Aulas.fromMap(Map<String, dynamic> json) => Aulas(
        aula: List<Aula>.from(json["AULA"].map((x) => Aula.fromMap(x))),
        totAu: json["_tot_au"],
      );
}

class Aula {
  Aula({
    required this.numIntAu,
    required this.abreviatura,
    required this.nombre,
  });

  String numIntAu;
  String abreviatura;
  String nombre;

  factory Aula.fromJson(String str) => Aula.fromMap(json.decode(str));

  factory Aula.fromMap(Map<String, dynamic> json) => Aula(
        numIntAu: json["_num_int_au"],
        abreviatura: json["_abreviatura"],
        nombre: json["_nombre"],
      );
}

class Grupos {
  Grupos({
    required this.grupo,
    required this.totGr,
  });

  List<Grupo> grupo;
  String totGr;

  factory Grupos.fromJson(String str) => Grupos.fromMap(json.decode(str));

  factory Grupos.fromMap(Map<String, dynamic> json) => Grupos(
        grupo: List<Grupo>.from(json["GRUPO"].map((x) => Grupo.fromMap(x))),
        totGr: json["_tot_gr"],
      );
}

class Grupo {
  Grupo({
    required this.numIntGr,
    required this.abreviatura,
    required this.nombre,
  });

  String numIntGr;
  String abreviatura;
  String nombre;

  factory Grupo.fromJson(String str) => Grupo.fromMap(json.decode(str));

  factory Grupo.fromMap(Map<String, dynamic> json) => Grupo(
        numIntGr: json["_num_int_gr"],
        abreviatura: json["_abreviatura"],
        nombre: json["_nombre"],
      );
}

class Profesores {
  Profesores({
    required this.profesor,
    required this.totPr,
  });

  List<Profesor> profesor;
  String totPr;

  factory Profesores.fromJson(String str) =>
      Profesores.fromMap(json.decode(str));

  factory Profesores.fromMap(Map<String, dynamic> json) => Profesores(
        profesor: List<Profesor>.from(
            json["PROFESOR"].map((x) => Profesor.fromMap(x))),
        totPr: json["_tot_pr"],
      );
}

class Profesor {
  Profesor({
    required this.numIntPr,
    required this.abreviatura,
    required this.nombre,
  });

  String numIntPr;
  String abreviatura;
  String nombre;

  factory Profesor.fromJson(String str) => Profesor.fromMap(json.decode(str));

  factory Profesor.fromMap(Map<String, dynamic> json) => Profesor(
        numIntPr: json["_num_int_pr"],
        abreviatura: json["_abreviatura"],
        nombre: json["_nombre"],
      );
}

class TramosHorarios {
  TramosHorarios({
    required this.tramo,
    required this.totTr,
  });

  List<Tramo> tramo;
  String totTr;

  factory TramosHorarios.fromJson(String str) =>
      TramosHorarios.fromMap(json.decode(str));

  factory TramosHorarios.fromMap(Map<String, dynamic> json) => TramosHorarios(
        tramo: List<Tramo>.from(json["TRAMO"].map((x) => Tramo.fromMap(x))),
        totTr: json["_tot_tr"],
      );
}

class Tramo {
  Tramo({
    required this.numTr,
    required this.numeroDia,
    required this.horaInicio,
    required this.horaFinal,
  });

  String numTr;
  String numeroDia;
  String horaInicio;
  String horaFinal;

  factory Tramo.fromJson(String str) => Tramo.fromMap(json.decode(str));

  factory Tramo.fromMap(Map<String, dynamic> json) => Tramo(
        numTr: json["_num_tr"],
        numeroDia: json["_numero_dia"],
        horaInicio: json["_hora_inicio"],
        horaFinal: json["_hora_final"],
      );
}

class Horarios {
  Horarios({
    required this.horariosProfesores,
  });

  HorariosProfesores horariosProfesores;

  factory Horarios.fromJson(String str) => Horarios.fromMap(json.decode(str));

  factory Horarios.fromMap(Map<String, dynamic> json) => Horarios(
        horariosProfesores:
            HorariosProfesores.fromMap(json["HORARIOS_PROFESORES"]),
      );
}

class HorariosProfesores {
  HorariosProfesores({
    required this.horarioProf,
  });

  List<HorarioProf> horarioProf;

  factory HorariosProfesores.fromJson(String str) =>
      HorariosProfesores.fromMap(json.decode(str));

  factory HorariosProfesores.fromMap(Map<String, dynamic> json) =>
      HorariosProfesores(
        horarioProf: List<HorarioProf>.from(
            json["HORARIO_PROF"].map((x) => HorarioProf.fromMap(x))),
      );
}

class HorarioProf {
  HorarioProf({
    required this.actividad,
    required this.horNumIntPr,
    required this.totUn,
    required this.totAc,
  });

  List<Actividad> actividad;
  String horNumIntPr;
  String totUn;
  String totAc;

  factory HorarioProf.fromJson(String str) =>
      HorarioProf.fromMap(json.decode(str));

  factory HorarioProf.fromMap(Map<String, dynamic> json) => HorarioProf(
        actividad: List<Actividad>.from(
            json["ACTIVIDAD"].map((x) => Actividad.fromMap(x))),
        horNumIntPr: json["_hor_num_int_pr"],
        totUn: json["_tot_un"],
        totAc: json["_tot_ac"],
      );
}

class Actividad {
  Actividad({
    required this.gruposActividad,
    required this.numAct,
    required this.numUn,
    required this.tramo,
    required this.asignatura,
    required this.aula,
  });

  GruposActividad gruposActividad;
  String numAct;
  String numUn;
  String tramo;
  String asignatura;
  String aula;

  factory Actividad.fromJson(String str) => Actividad.fromMap(json.decode(str));

  factory Actividad.fromMap(Map<String, dynamic> json) => Actividad(
        gruposActividad: GruposActividad.fromMap(json["GRUPOS_ACTIVIDAD"]),
        numAct: json["_num_act"],
        numUn: json["_num_un"],
        tramo: json["_tramo"],
        asignatura: json["_asignatura"],
        aula: json["_aula"],
      );
}

class GruposActividad {
  GruposActividad({
    required this.totGrAct,
    required this.grupo1,
    required this.grupo2,
    required this.grupo3,
    required this.grupo4,
  });

  String totGrAct;
  String? grupo1;
  String? grupo2;
  String? grupo3;
  String? grupo4;

  factory GruposActividad.fromJson(String str) =>
      GruposActividad.fromMap(json.decode(str));

  factory GruposActividad.fromMap(Map<String, dynamic> json) => GruposActividad(
        totGrAct: json["_tot_gr_act"],
        grupo1: json["_grupo_1"] == null ? null : json["_grupo_1"],
        grupo2: json["_grupo_2"] == null ? null : json["_grupo_2"],
        grupo3: json["_grupo_3"] == null ? null : json["_grupo_3"],
        grupo4: json["_grupo_4"] == null ? null : json["_grupo_4"],
      );
}
