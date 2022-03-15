import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      selectedItemColor: Color(0xFF02569d),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.timelapse), label: "Agenda"),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline), label: "Comunicaciones"),
      ],
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
    );
  }
}
