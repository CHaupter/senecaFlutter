import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Color(0xFF02569d),
        unselectedItemColor: Colors.grey,
        backgroundColor: Color.fromRGBO(55, 57, 84, 1),
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.timelapse), label: "Agenda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: "Comunicaciones"),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_vert_sharp), label: "Menú"),
        ]);
  }
}
