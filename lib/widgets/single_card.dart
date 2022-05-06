import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  final String icon;
  final String text;

  const SingleCard({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        height: size.height * 0.15,
        margin: EdgeInsets.only(
            top: size.height * 0.1,
            right: size.width * 0.05,
            left: size.width * 0.05),
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              child: Image.asset(
                this.icon,
              ),
            ),
            Text(
              this.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
