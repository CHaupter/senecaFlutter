import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    String usuarioTexto = "";
    String passTexto = "";
    bool mostrarTexto = false;

    final _inputDecorationUsuario = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3)),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3)),
      hintStyle: TextStyle(color: Colors.white),
      hintText: "Nombre de usuario",
      filled: true,
    );

    final _inputDecorationPass = InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3)),
        hintText: "Contraseña",
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        suffixIcon: IconButton(
          onPressed: () => setState(() {
            mostrarTexto = !mostrarTexto;
          }),
          icon: Icon(
            Icons.remove_red_eye,
            color: Colors.white,
          ),
        ));

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF005499), Color(0xFF01315a)])),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 160,
                        ),
                        Text(
                          "iSéneca",
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ErasDemi'),
                        ),
                        TextField(
                          decoration: _inputDecorationUsuario,
                          onChanged: (value) => setState(() {
                            usuarioTexto = value;
                          }),
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: _inputDecorationPass,
                          onChanged: (value) => setState(() {
                            passTexto = value;
                          }),
                          style: TextStyle(color: Colors.white),
                          obscureText: mostrarTexto,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "home_screen");
                            },
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 20),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: TextButton(
                              child: Text("No recuerdo mi contraseña",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  )),
                              onPressed: null),
                        ),
                        Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 170,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    child: Image(
                                      color: Colors.white,
                                      image:
                                          AssetImage("assets/iconoJunta.png"),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Junta de Andalucía",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17)),
                                      Text(
                                        "Consejería de Educación y Deporte",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                  alignment: Alignment.bottomRight,
                                  child: Text("v11.3.0",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ]),
        ));
  }
}
