// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  int currentIndex;
  PageController controller;

  BottomNavBar(this.currentIndex, this.controller, {Key? key})
      : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      selectedItemColor: Color(0xFF02569d),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      currentIndex: widget.currentIndex,
      onTap: (value) {
        setState(() {
          widget.currentIndex = value;

          widget.controller.animateToPage(widget.currentIndex,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(icon: Icon(Icons.timelapse), label: "Agenda"),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline), label: "Comunicaciones"),
      ],
    );
  }

  setBottomIndex(int value) {
    setState(() {
      widget.currentIndex = value;
    });
  }
}
