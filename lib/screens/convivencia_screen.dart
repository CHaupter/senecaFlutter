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
      body: ListView(children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "parte_screen"),
          child: Card(
              child: ListTile(
            leading: FaIcon(FontAwesomeIcons.paperPlane),
            title: Text('Partes'),
          )),
        ),
        Card(
            child: ListTile(
          leading: FaIcon(FontAwesomeIcons.handPaper),
          title: Text('Ver alumnado expulsado'),
        )),
      ]),
    );
  }
}
