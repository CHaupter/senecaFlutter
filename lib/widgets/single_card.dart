import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const SingleCard({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        height: size.height * 0.27,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 45, top: 60),
              child: CircleAvatar(
                radius: 0,
                child: Icon(
                  this.icon,
                  size: 40,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 45),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                this.text,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          ],
        ));
  }
}
