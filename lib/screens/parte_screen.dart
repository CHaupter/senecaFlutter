import 'package:flutter/material.dart';

class ParteScreen extends StatefulWidget {
  const ParteScreen({Key? key}) : super(key: key);

  @override
  State<ParteScreen> createState() => _ParteScreenState();
}

class _ParteScreenState extends State<ParteScreen> {
  bool visibleLeve = false;
  bool visibleGrave = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manual de partes"),
      ),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.only(
            top: 40,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      print("Tocado");

                      visibleLeve = !visibleLeve;
                      visibleGrave = false;
                    }),
                    child: CircleAvatar(
                      radius: 100,
                      foregroundColor: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_alarm,
                            size: 70,
                          ),
                          Text("LEVE", style: TextStyle(fontSize: 45))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      print("Tocado");

                      visibleGrave = !visibleGrave;
                      visibleLeve = false;
                    }),
                    child: CircleAvatar(
                        radius: 100,
                        foregroundColor: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_alarm,
                              size: 70,
                            ),
                            Text(
                              "GRAVE",
                              style: TextStyle(fontSize: 45),
                            )
                          ],
                        )),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Stack(children: [
                  Visibility(
                    visible: visibleLeve,
                    child: Container(
                      child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                        child: Text(
                          "1.- Actuaciones que no interrumpen el transcurso normal de la clase. Apercibimiento verbal al alumnado. \n\n 2.- Comunicación vía iPasen a las familias. OBLIGATORIO. En la posibilidad de llama telefónica para aquellos alumnos con problemas. \n\n 3.- A criterio del profesor hacer parte correspondiente para convivencia.",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Visibility(
                      visible: visibleGrave,
                      child: Container(
                        child: Text(
                          " 1.-Solamente cuando impida el desarrollo normal de la clase o es un acto lo suficientemente grave a criterio del profesor." +
                              "\n\n 2.- El delegado de clase irá a por un profesor de guardia o directivo de guardia." +
                              "\n\n 3.- Mientras el profesorado remitirá un mensaje al whatApp de Convivencia de la directiva diciendo lo que ha sucedido lo más detalladamente posible." +
                              "\n\n 4.- El directivo o convivencia llamará a las familias para que vengan inmediatamente al centro." +
                              "\n\n 5.- El equipo directivo junto a convivencia determinará la gravedad y puede darse tres escenarios:" +
                              "\n\n      1. El alumno se va expulsado a casa con su familia." +
                              "\n\n      2. El alumno se queda en el aula de mayores hasta finalizar la jornada porque no viene ningún familiar." +
                              "\n\n      3. El alumno se incorpora a la siguiente hora a su grupo." +
                              "\n\n 6.- El profesorado debe rellenar de forma obligatoria el parte correspondiente e informar a todo el equipo educativo de dicho curso a través de observaciones compartidas lo sucedido. En caso de no impartir clase al alumno el profesorado deberá rellenar el parte e informar al tutor de la clase del alumno lo sucedido.",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
