import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seneca_aplicacion/screens/agenda_screen.dart';
import 'package:seneca_aplicacion/screens/home_screen.dart';
import 'package:seneca_aplicacion/screens/screens.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = PageController(
    initialPage: 0,
  );

  int pageIndex = 0;

  int navBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
      controller: controller,
      children: [HomeScreen(), AgendaScreen(), ComunicacionScreen()],
      onPageChanged: (value) {
        pageIndex = value;
        setNavBarIndex(value);
      },
    );

    return Scaffold(
        body: Container(
          child: pageView,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Color(0xFF02569d),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          currentIndex: navBarIndex,
          onTap: (value) {
            pageIndex = value;
            controller.animateToPage(value,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.timelapse), label: "Agenda"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline), label: "Comunicaciones"),
          ],
        ));
  }

  setNavBarIndex(int index) {
    setState(() {
      navBarIndex = index;
    });
  }
}
