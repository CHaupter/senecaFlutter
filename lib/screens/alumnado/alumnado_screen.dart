import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlumnadoScreen extends StatelessWidget {
  const AlumnadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ALUMNADO"),
      ),
      body: Container(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, "contacto_alumnado_screen"),
              child: Card(
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.peopleCarry),
                  title: Text('Mail/Teléfono'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, "localizacion_alumnado_screen"),
              child: Card(
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.peopleCarry),
                  title: Text('Localizacion'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, "horario_alumnado_screen"),
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
