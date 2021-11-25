import 'package:flutter/material.dart';
import 'package:seneca_aplicacion/providers/centro_provider.dart';
import 'package:seneca_aplicacion/providers/credenciales_provider.dart';
import 'package:seneca_aplicacion/screens/screens.dart';
import "package:firebase_core/firebase_core.dart";

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CredencialesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CentroProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => LoginScreen(),
        "home_screen": (BuildContext context) => HomeScreen(),
        "convivencia_screen": (BuildContext context) => ConvivenciaScreen(),
        "parte_screen": (BuildContext context) => ParteScreen(),
        "personal_screen": (BuildContext context) => PersonalScreen(),
        "listado_screen": (BuildContext context) => ListadoProfesores(),
      },
    );
  }
}
