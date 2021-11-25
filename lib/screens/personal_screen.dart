import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seneca_aplicacion/screens/screens.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PERSONAL"),
      ),
      body: Container(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "listado_screen"),
              child: Card(
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.peopleCarry),
                  title: Text('Profesores'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
