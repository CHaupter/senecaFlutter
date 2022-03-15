import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaOpciones extends StatefulWidget {
  @override
  State<ListaOpciones> createState() => _ListaOpcionesState();
}

class _ListaOpcionesState extends State<ListaOpciones> {
  //bool esVisible = false;
  double alturaOpciones = 0;
  double anchuraOpciones = 0;

  @override
  Widget build(BuildContext context) {
    anchuraOpciones = 120;
    alturaOpciones = 100;

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
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    setState(() {
                      //esVisible = !esVisible;

                      alturaOpciones = 300;
                      anchuraOpciones = 200;
                      //print(esVisible);
                    });
                  },
                  icon: Icon(Icons.more_vert_sharp),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          AnimatedContainer(
            margin: EdgeInsets.only(right: 10),
            color: Colors.red,
            height: 100,
            width: 120,
            curve: Curves.ease,
            duration: Duration(milliseconds: 1000),
            child: Row(
              children: [
                Expanded(child: Container()),
                Container(
                    child: ListView(children: [
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "contacto_screen"),
                    child: Card(
                      child: ListTile(
                        title: Text('Mail/Teléfono'),
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
