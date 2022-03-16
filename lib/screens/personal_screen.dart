import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              onTap: () => Navigator.pushNamed(context, "contacto_screen"),
              child: Card(
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.peopleCarry),
                  title: Text('Mail/Teléfono'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "listado_screen"),
              child: Card(
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.peopleCarry),
                  title: Text('Profesores'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "horario_screen"),
              child: Card(
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.peopleCarry),
                  title: Text('Horario'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
