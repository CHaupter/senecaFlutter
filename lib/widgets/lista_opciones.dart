import 'package:flutter/material.dart';
import 'package:seneca_aplicacion/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ListaOpciones extends StatefulWidget {
  @override
  State<ListaOpciones> createState() => _ListaOpcionesState();
}

class _ListaOpcionesState extends State<ListaOpciones> {
  bool esVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                child: IconButton(
                    onPressed: () {
                      launch("https://www.iesjandula.es");
                    },
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    )),
              ),
              Container(
                child: IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    setState(() {
                      esVisible = !esVisible;
                    });
                  },
                  icon: Icon(Icons.more_vert_sharp),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Visibility(
            visible: esVisible,
            child: Row(
              children: [
                Expanded(child: Container()),
                Container(
                    height: 400,
                    width: 220,
                    child: ListView(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          LogOut();
                        },
                        child: Card(
                          child: ListTile(
                            title: Text('Cerrar sesión'),
                          ),
                        ),
                      ),
                    ])),
              ],
            ),
          )
        ],
      ),
    );
  }
}
