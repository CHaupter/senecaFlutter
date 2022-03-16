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
                    icon: Icons.people, text: "Alumnado del centro")),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "personal_screen"),
              child: SingleCard(
                  icon: Icons.emoji_people_outlined,
                  text: "Personal del centro"),
            ),
            SingleCard(icon: Icons.sick, text: "Información Covid"),
          ]),
          TableRow(children: [
            SingleCard(
                icon: Icons.tablet_mac_outlined, text: "Tablón de anuncios"),
            SingleCard(icon: Icons.calendar_today, text: "Calendario escolar"),
            Container()
          ])
        ],
      ),
    );
  }
}
