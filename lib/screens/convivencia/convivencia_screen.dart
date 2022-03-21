import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConvivenciaScreen extends StatelessWidget {
  const ConvivenciaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CONVIVENCIA"),
      ),
      body: Container(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "expulsados_screen"),
              child: Card(
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.boxes),
                  title: Text('Expulsados'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "mayores_screen"),
              child: Card(
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.braille),
                  title: Text('Mayores'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
