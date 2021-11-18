import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Column(
        children: [
          Center(
            child: Text("iSéneca",
                style: TextStyle(
                    fontSize: 60, color: Colors.white, fontFamily: 'ErasDemi')),
          ),
        ],
      ),
    );
  }
}
