import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seneca_aplicacion/widgets/BottomNavBar.dart';

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
              children: [TitlePage(), UserCard(), TablaAccesos()],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class TablaAccesos extends StatelessWidget {
  const TablaAccesos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        border: TableBorder(
            verticalInside: BorderSide(color: Colors.grey, width: 0.5),
            horizontalInside: BorderSide(color: Colors.grey, width: 0.5)),
        children: [
          TableRow(children: [
            _SingleCard(icon: Icons.people, text: "Alumnado del centro"),
            _SingleCard(
                icon: Icons.emoji_people_outlined, text: "Personal del centro"),
            _SingleCard(icon: Icons.sick, text: "Información Covid"),
          ]),
          TableRow(children: [
            _SingleCard(
                icon: Icons.tablet_mac_outlined, text: "Tablón de anuncios"),
            _SingleCard(icon: Icons.calendar_today, text: "Calendario escolar"),
            Container()
          ])
        ],
      ),
    );
  }
}

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

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 0.7,
              color: Colors.grey,
              offset: Offset(0, 1))
        ],
      ),
      width: 400,
      height: 200,
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 15),
                              child: Text(
                                "Haupter Pérez, Carlos",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              margin: EdgeInsets.only(right: 10, top: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward,
                                    color: Colors.grey,
                                  ),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(Icons.person)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            child: Column(children: [
                              Text("I.E.S. Jándula",
                                  style: TextStyle(
                                      color: Colors.blue[300],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text("Perfil alumno",
                                  style: TextStyle(
                                      color: Colors.blue[300],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
                            ]),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 65,
              width: double.infinity,
              color: Colors.blue,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Row(
                        children: [
                          Icon(
                            Icons.alarm,
                            color: Colors.white,
                          ),
                          Text("Avisos", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    VerticalDivider(
                      color: Colors.white,
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      child: Row(
                        children: [
                          Icon(Icons.book, color: Colors.white),
                          Text("Bandeja de firmas",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SingleCard({Key? key, required this.icon, required this.text})
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
