import 'package:flutter/material.dart';
import 'package:seneca_aplicacion/widgets/lista_opciones.dart';
import 'package:seneca_aplicacion/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Background(),
          ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    TitlePage(),
                    UserCard(),
                    ItemTable(),
                  ],
                ),
              )
            ],
          ),
          ListaOpciones()
        ]),
      ),
    );
  }
}
