import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seneca_aplicacion/providers/providers.dart';
import 'package:seneca_aplicacion/screens/screens.dart';
import "package:firebase_core/firebase_core.dart";

import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/service/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  LogOut();

  runApp(AppState());
}

void LogOut() async {
  FirebaseService service = new FirebaseService();
  try {
    await service.signOutFromGoogle();
  } catch (e) {
    if (e is FirebaseAuthException) {
      print(e.message!);
    }
  }
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
