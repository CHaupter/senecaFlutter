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
        border: TableBorder(
            verticalInside: BorderSide(color: Colors.grey, width: 0.5),
            horizontalInside: BorderSide(color: Colors.grey, width: 0.5)),
        children: [
          TableRow(children: [
            SingleCard(icon: Icons.people, text: "Alumnado del centro"),
            SingleCard(
                icon: Icons.emoji_people_outlined, text: "Personal del centro"),
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
