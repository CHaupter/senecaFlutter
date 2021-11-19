import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xFF02569d),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
