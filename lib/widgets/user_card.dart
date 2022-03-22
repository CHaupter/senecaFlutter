import 'package:flutter/material.dart';
import 'package:seneca_aplicacion/main.dart';
import 'package:seneca_aplicacion/screens/interfaz/main_screen.dart' as main;
import 'package:seneca_aplicacion/service/services.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 0.7,
              color: Colors.grey,
              offset: Offset(0, 1))
        ],
      ),
      width: 400,
      height: 185,
      child: Column(
        children: [
          _UsuarioOpciones(),
          _LineaBotones(),
        ],
      ),
    );
  }
}

class _UsuarioOpciones extends StatelessWidget {
  const _UsuarioOpciones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Expanded(
      flex: 7,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      user!.displayName.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(right: 10, top: 15),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/");
                              LogOut();
                            },
                            icon: Icon(Icons.logout)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 20),
                  child: Column(children: [
                    Text("I.E.S. Jándula",
                        style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text("Perfil alumno",
                        style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 16,
                            fontWeight: FontWeight.bold))
                  ]),
                )),
          ],
        ),
      ),
    );
  }
}

class _LineaBotones extends StatelessWidget {
  const _LineaBotones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        height: 65,
        width: double.infinity,
        color: Colors.blue,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: Colors.white,
                    ),
                    Text("Avisos", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Expanded(child: Container()),
              VerticalDivider(
                color: Colors.white,
              ),
              Expanded(child: Container()),
              GestureDetector(
                child: Row(
                  children: [
                    Icon(Icons.book, color: Colors.white),
                    Text("Bandeja de firmas",
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
