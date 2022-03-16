import 'package:flutter/material.dart';
import 'package:seneca_aplicacion/widgets/widgets.dart';

class ItemTable extends StatelessWidget {
  const ItemTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        children: [
          TableRow(children: [
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, "convivencia_screen"),
                child: SingleCard(
                    icon: "assets/sombrero.png", text: "Alumnado del centro")),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "personal_screen"),
              child: SingleCard(
                  icon: "assets/profesor.png", text: "Personal del centro"),
            ),
            SingleCard(icon: "assets/covid.png", text: "Información Covid"),
          ]),
          TableRow(children: [
            SingleCard(icon: "assets/campana.png", text: "DACE"),
            SingleCard(icon: "assets/calendario.png", text: "Baño"),
            Container()
          ])
        ],
      ),
    );
  }
}
