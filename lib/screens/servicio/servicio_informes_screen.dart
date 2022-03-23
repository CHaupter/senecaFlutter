import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/models/servicio_response.dart';
import 'package:seneca_aplicacion/providers/servicio_provider.dart';

class ServicioInformesScreen extends StatefulWidget {
  const ServicioInformesScreen({Key? key}) : super(key: key);

  @override
  State<ServicioInformesScreen> createState() => _ServicioInformesScreenState();
}

class _ServicioInformesScreenState extends State<ServicioInformesScreen> {
  String selectedDateInicio = "";
  String selectedDateFin = "";
  bool fechaInicioEscogida = false;
  List<Servicio> listaAlumnosFechas = [];
  DateTime dateTimeInicio = DateTime.now();
  DateTime dateTimeFin = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final servicioProvider = Provider.of<ServicioProvider>(context);
    servicioProvider.getAlumnosServicio();

    final listadoAlumnosServicio = servicioProvider.listadoAlumnosServicio;
    listaAlumnosFechas.clear();
    listaAlumnosFechas.addAll(listadoAlumnosServicio);

    double altura = MediaQuery.of(context).size.height;
    double anchura = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("INFORMES"),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Container(
                  width: anchura * 0.5,
                  child: TextField(
                    readOnly: true,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    controller: TextEditingController(text: selectedDateInicio),
                    decoration: InputDecoration(
                      labelText: "FECHA INICIO",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today_rounded),
                        onPressed: () {
                          fechaInicioEscogida = true;
                          mostrarFecha(
                              "Inicio", servicioProvider, listaAlumnosFechas);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: anchura * 0.5,
                  child: TextField(
                    enabled: fechaInicioEscogida,
                    readOnly: true,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    controller: TextEditingController(text: selectedDateFin),
                    decoration: InputDecoration(
                      labelText: "FECHA FIN",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today_rounded),
                        onPressed: () => mostrarFecha(
                            "Fin", servicioProvider, listaAlumnosFechas),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listaAlumnosFechas.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: ListTile(
                      title: Text("${listaAlumnosFechas[index].nombreAlumno}")),
                );
              },
            ),
          )
        ],
      )),
    );
  }

  void mostrarFecha(String modo, ServicioProvider servicioProvider,
      List<Servicio> listaAlumnosFechas) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            color: Colors.white,
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                minimumYear: DateTime.now().year - 1,
                maximumYear: DateTime.now().year,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  String valueFormat = DateFormat("dd-MM-yyyy").format(value);

                  if (modo == "Inicio") {
                    setState(() {
                      selectedDateInicio = valueFormat;
                      dateTimeInicio = value;
                    });
                  }

                  if (modo == "Fin") {
                    setState(() {
                      selectedDateFin = valueFormat;
                      dateTimeFin = value;
                    });

                    updateLista(servicioProvider, dateTimeInicio, dateTimeFin);
                  }
                }),
          );
        });
  }

  void updateLista(ServicioProvider servicioProvider, DateTime dateTimeInicio,
      DateTime dateTimeFin) {
    servicioProvider.getAlumnosServicio();
    final listadoAlumnadoServicio = servicioProvider.listadoAlumnosServicio;
    listaAlumnosFechas.clear();

    for (int i = 0; i < listadoAlumnadoServicio.length; i++) {
      bool dentro = compararFechas(
          listadoAlumnadoServicio[i], dateTimeInicio, dateTimeFin);

      if (dentro) {
        listaAlumnosFechas.add(listadoAlumnadoServicio[i]);
      }
    }
  }

  bool compararFechas(
      Servicio listadoAlumnadoServicio, DateTime dateInicio, DateTime dateFin) {
    bool estaDentro = false;
    List<String> listaFechasEntrada =
        listadoAlumnadoServicio.fechaEntrada.split("-");

    List<String> listaFechasSalida =
        listadoAlumnadoServicio.fechaSalida.split("-");

    String diaAlumnoEntrada = listaFechasEntrada[0];
    String mesAlumnoEntrada = listaFechasEntrada[1];
    String anoAlumnoEntrada = listaFechasEntrada[2].substring(0, 4);

    String diaAlumnoSalida = listaFechasSalida[0];
    String mesAlumnoSalida = listaFechasSalida[1];
    String anoAlumnoSalida = listaFechasSalida[2].substring(0, 4);

    String fechaEntrada = "$anoAlumnoEntrada$mesAlumnoEntrada$diaAlumnoEntrada";
    DateTime fechaEntradaParseada = DateTime.parse(fechaEntrada);

    String fechaSalida = "$anoAlumnoSalida$mesAlumnoSalida$diaAlumnoSalida";
    DateTime fechaSalidaParseada = DateTime.parse(fechaSalida);

    if (fechaEntradaParseada.isAfter(dateInicio) &&
        fechaSalidaParseada.isBefore(dateFin)) {
      estaDentro = true;
    }

    return estaDentro;
  }
}
