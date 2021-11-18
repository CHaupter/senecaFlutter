import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seneca_aplicacion/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Background(),
          Container(
            child: Column(
              children: [TitlePage(), UserCard(), ItemTable()],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
