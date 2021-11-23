import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seneca_aplicacion/service/firebase_service.dart';

class GoogleSignOut extends StatefulWidget {
  GoogleSignOut({Key? key}) : super(key: key);

  @override
  _GoogleSignOutState createState() => _GoogleSignOutState();
}

class _GoogleSignOutState extends State<GoogleSignOut> {
  set isSignedIn(bool isSignedIn) {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: size.width * 0.85,
      height: 55,
      child: OutlinedButton.icon(
          onPressed: () async {
            FirebaseService service = new FirebaseService();
            try {
              await service.signOutFromGoogle();
              isSignedIn = false;
            } catch (e) {
              if (e is FirebaseAuthException) {
                print(e.message!);
              }
            }
          },
          icon: FaIcon(FontAwesomeIcons.google),
          label: Text("Log Out"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              side: MaterialStateProperty.all<BorderSide>(BorderSide.none))),
    );
  }
}
