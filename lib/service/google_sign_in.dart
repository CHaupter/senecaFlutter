import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/main.dart';
import 'package:seneca_aplicacion/providers/credenciales_provider.dart';
import 'package:seneca_aplicacion/service/firebase_service.dart';

class GoogleSignIn extends StatefulWidget {
  GoogleSignIn({Key? key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final credencialesProvider = Provider.of<CredencialesProvider>(context);
    final lista = credencialesProvider.listaCredenciales;

    Size size = MediaQuery.of(context).size;

    return !isLoading
        ? Container(
            margin: EdgeInsets.only(top: 15),
            width: size.width * 0.85,
            height: 55,
            child: OutlinedButton.icon(
              icon: FaIcon(FontAwesomeIcons.google),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                FirebaseService service = new FirebaseService();
                try {
                  await service.signInWithGoogle();

                  User? user = FirebaseAuth.instance.currentUser;
                  String? usuarioGoogle = user!.email;

                  String? nombreUsuarioGoogle = user.displayName;
                  bool existe = false;

                  for (int i = 0; i < lista.length; i++) {
                    print(lista[i].usuario);
                    if (lista[i].usuario == usuarioGoogle.toString()) {
                      existe = true;
                      Navigator.pushNamed(context, "main_screen",
                          arguments: nombreUsuarioGoogle);
                    }
                  }

                  if (!existe) {
                    _mostrarAlert(context);
                    LogOut();
                  }
                } catch (e) {
                  if (e is FirebaseAuthException) {
                    print(e.message!);
                  }
                  if (e is PlatformException) {
                    LogOut();
                  }
                }
                setState(() {
                  isLoading = false;
                });
              },
              label: Text(
                "Accede a tu cuenta de Google",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
            ),
          )
        : Container(
            margin: EdgeInsets.all(15), child: CircularProgressIndicator());
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
          title: Text("Error en la verificaci??n"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("No existe ninguna cuenta con esas credenciales"),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("OK")),
          ],
        );
      });
}
