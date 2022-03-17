import 'package:flutter/material.dart';
import 'package:seneca_aplicacion/service/services.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          false, //Inhabilita el botón del dispositivo para volver atrás
      child: Scaffold(
        body: Stack(
          children: [
            //Background
            Background(),
            //Content
            Content(),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.8],
          colors: [Color(0xff005298), Color(0xff01315a)],
        ),
      ),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Center(
        child: Column(
          children: [
            SizedBox(height: 50),

            //Titulo
            Text(
              "iJándula",
              style: TextStyle(
                fontFamily: 'ErasDemi',
                color: Colors.white,
                fontSize: 75,
                //fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 110),

            //Botón Google
            GoogleSignIn(),

            SizedBox(height: 70),

            //No recuerdo contraseña
            /*Text(
              "No recuerdo mi contraseña",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),*/

            Divider(
              height: 18,
              color: Colors.white,
              indent: 77,
              endIndent: 77,
            ),

            SizedBox(height: 100),

            //Logo
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 5),
                  child: Image.asset(
                    "assets/iconoJunta.png",
                    height: 65,
                    width: 65,
                    color: Colors.white,
                  ),
                ),

                //Texto Junta Andalucía
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("IES Jándula",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 7),
                    Text("Desarrollo Aplicaciones Multiplataforma",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),

            //Versión
            Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              alignment: Alignment.bottomRight,
              child: Text("v1.1.0",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    ]);
  }
}
