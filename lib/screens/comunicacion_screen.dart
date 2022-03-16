import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComunicacionScreen extends StatelessWidget {
  const ComunicacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "MENSAJES",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      maximumSize: Size.fromRadius(70),
                      shape: CircleBorder(),
                      onSurface: Colors.white,
                      shadowColor: Colors.grey,
                    ),
                    onPressed: null,
                    child: Icon(
                      Icons.add_circle_outline_sharp,
                      size: 70,
                      color: Colors.blue,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
