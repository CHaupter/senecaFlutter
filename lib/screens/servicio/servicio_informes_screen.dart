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
  List<String> listaAlumnosNombres = [];
  DateTime dateTimeInicio = DateTime.now();
  DateTime dateTimeFin = DateTime.now();
  int size = 0;
  int repeticiones = 0;

  @override
  Widget build(BuildContext context) {
    final servicioProvider = Provider.of<ServicioProvider>(context);
    final listadoAlumnosServicio = servicioProvider.listadoAlumnosServicio;

    //double altura = MediaQuery.of(context).size.height;
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
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: anchura * 0.5,
                      child: TextField(
                        readOnly: true,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        controller:
                            TextEditingController(text: selectedDateInicio),
                        decoration: InputDecoration(
                          labelText: "FECHA INICIO",
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today_rounded),
                            onPressed: () {
                              fechaInicioEscogida = true;
                              mostrarFecha(
                                  "Inicio", listaAlumnosFechas, context);
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
                        controller:
                            TextEditingController(text: selectedDateFin),
                        decoration: InputDecoration(
                          labelText: "FECHA FIN",
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today_rounded),
                            onPressed: () => mostrarFecha(
                                "Fin", listaAlumnosFechas, context),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        listaAlumnosFechas = [];
                        listaAlumnosNombres = [];
                        updateLista(context, dateTimeInicio, dateTimeFin);

                        // for (int i = 0; i < listaAlumnosFechas.length; i++) {
                        //   print(listaAlumnosFechas[i].nombreAlumno);
                        // }

                        for (int i = 0; i < listaAlumnosFechas.length; i++) {
                          listaAlumnosNombres
                              .add(listaAlumnosFechas[i].nombreAlumno);
                        }

                        listaAlumnosNombres =
                            listaAlumnosNombres.toSet().toList();

                        listaAlumnosNombres.sort(((a, b) => a.compareTo(b)));
                        size = listaAlumnosNombres.length;
                      });
                    },
                    child: Text("MOSTRAR"))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: size,
              itemBuilder: (context, index) {
                repeticiones =
                    _calcularRepeticiones(listaAlumnosNombres[index]);

                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, "servicio_informes_detalles_screen",
                      arguments: listaAlumnosNombres[index]),
                  child: ListTile(
                    title: Text("${listaAlumnosNombres[index]}"),
                    subtitle: Text("Cantidad $repeticiones"),
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }

  void mostrarFecha(
      String modo, List<Servicio> listaAlumnosFechas, BuildContext context) {
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

                    // updateLista(servicioProvider, dateTimeInicio, dateTimeFin);
                  }
                }),
          );
        });
  }

  void updateLista(
      BuildContext context, DateTime dateTimeInicio, DateTime dateTimeFin) {
    final servicioProviderLista =
        Provider.of<ServicioProvider>(context, listen: false);
    final listadoAlumnadoServicio =
        servicioProviderLista.listadoAlumnosServicio;

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

    if (fechaEntradaParseada.isAfter(dateInicio.subtract(Duration(days: 1))) &&
        fechaSalidaParseada.isBefore(dateFin.add(Duration(days: 1)))) {
      estaDentro = true;
    }

    return estaDentro;
  }

  int _calcularRepeticiones(String nombreAlumno) {
    int num = 0;

    for (int i = 0; i < listaAlumnosFechas.length; i++) {
      if (nombreAlumno == listaAlumnosFechas[i].nombreAlumno) {
        num++;
      }
    }
    return num;
  }
}
