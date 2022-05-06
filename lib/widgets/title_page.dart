import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.03),
      width: double.infinity,
      child: Column(
        children: [
          Center(
            child: Text("iJándula",
                style: TextStyle(
                    fontSize: 60, color: Colors.white, fontFamily: 'ErasDemi')),
          ),
        ],
      ),
    );
  }
}
