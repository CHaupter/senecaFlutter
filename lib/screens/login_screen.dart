//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/main.dart';
import 'package:seneca_aplicacion/models/credenciales.dart';
import 'package:seneca_aplicacion/providers/credenciales_provider.dart';
import 'package:seneca_aplicacion/service/google_sign_in.dart';
import 'package:seneca_aplicacion/service/google_sign_out.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool mostrarTexto = true;

  //final fb = FirebaseDatabase.instance;
  String usuarioTexto = "";
  String passTexto = "";

  @override
  Widget build(BuildContext context) {
    final credencialesProvider = Provider.of<CredencialesProvider>(context);
    final lista = credencialesProvider.listaCredenciales;
    //lista = credencialesProvider.listaCredenciales;

    print(lista.length);

    print("Tamaño lista: " +
        credencialesProvider.listaCredenciales.length.toString());

    InputDecoration _inputDecorationUsuario = InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3)),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3)),
      hintStyle: TextStyle(color: Colors.white),
      hintText: "Nombre de usuario",
      filled: true,
    );

    InputDecoration _inputDecorationPass = InputDecoration(
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
        body: Center(
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF005499), Color(0xFF01315a)])),
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 120),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "iSéneca",
                          style: TextStyle(
                              fontSize: 60,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'ErasDemi'),
                        ),
                        Container(
                          child: TextField(
                            decoration: _inputDecorationUsuario,
                            onChanged: (value) => setState(() {
                              usuarioTexto = value;
                            }),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: TextField(
                            decoration: _inputDecorationPass,
                            onChanged: (value) => setState(() {
                              passTexto = value;
                            }),
                            style: TextStyle(color: Colors.white),
                            obscureText: mostrarTexto,
                          ),
                        ),
                        ComprobarCredenciales(
                            listaCredenciales: lista,
                            usuario: usuarioTexto,
                            pass: passTexto),
                        GoogleSignIn(),
                        RecuperarPass(),
                        TituloInferior()
                      ]),
                ),
              ),
            ),
          ]),
        ));
  }
}

class TituloInferior extends StatelessWidget {
  const TituloInferior({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 180),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: Image(
                  color: Colors.white,
                  image: AssetImage("assets/iconoJunta.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Junta de Andalucía",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  Text(
                    "Consejería de Educación y Deporte",
                    style: TextStyle(color: Colors.white, fontSize: 17),
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
    );
  }
}

class RecuperarPass extends StatelessWidget {
  const RecuperarPass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: TextButton(
        child: Text("No recuerdo mi contraseña",
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            )),
        onPressed: null,
      ),
    );
  }
}

class ComprobarCredenciales extends StatelessWidget {
  final List<Credenciales> listaCredenciales;
  final String usuario;
  final String pass;
  const ComprobarCredenciales(
      {Key? key,
      required this.listaCredenciales,
      required this.usuario,
      required this.pass})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () {
          if (_comprobarCredenciales(listaCredenciales, usuario, pass)) {
            Navigator.pushNamed(context, "home_screen");
          } else {
            _mostrarAlert(context);
            LogOut();
          }
        },
        child: Text(
          "Entrar",
          style: TextStyle(color: Colors.blueAccent, fontSize: 20),
        ),
      ),
    );
  }

  bool _comprobarCredenciales(
      List<Credenciales> listaCredenciales, String? usuario, String pass) {
    bool credencialesCorrectas = false;

    for (int i = 0; i < listaCredenciales.length; i++) {
      if (listaCredenciales[i].usuario == usuario.toString()) {
        credencialesCorrectas = true;
      }
    }

    return credencialesCorrectas;
  }
}

void _mostrarAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("Error en la verificación"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("No existe ninguna cuenta con esas credenciales"),
              FlutterLogo(size: 100.0),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("OK")),
          ],
        );
      });
}
