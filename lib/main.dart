import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seneca_aplicacion/providers/providers.dart';
import 'package:seneca_aplicacion/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/service/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
          create: (_) => ConvivenciaProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ServicioProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => AlumnadoProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CentroProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => DaceProvider(),
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
        "main_screen": (BuildContext context) => MainScreen(),
        "convivencia_screen": (BuildContext context) => ConvivenciaScreen(),
        "expulsados_screen": (BuildContext context) => ExpulsadosScreen(),
        "mayores_screen": (BuildContext context) => MayoresScreen(),
        "dace_screen": (BuildContext context) => DaceScreen(),
        "personal_screen": (BuildContext context) => PersonalScreen(),
        "listado_profesores_screen": (BuildContext context) =>
            ListadoProfesores(),
        "contacto_profesores_screen": (BuildContext context) =>
            ContactoProfesoresScreen(),
        "horario_profesores_screen": (BuildContext context) =>
            HorarioProfesoresScreen(),
        "horario_profesores_detalles_screen": (BuildContext context) =>
            HorarioProfesoresDetallesScreen(),
        "alumnado_screen": (BuildContext context) => AlumnadoScreen(),
        "contacto_alumnado_screen": (BuildContext context) =>
            ContactoAlumnadoScreen(),
        "localizacion_alumnado_screen": (BuildContext context) =>
            LocalizacionAlumnadoScreen(),
        "horario_alumnado_screen": (BuildContext context) =>
            HorarioAlumnadoScreen(),
        "horario_detalles_alumnado_screen": (BuildContext context) =>
            HorarioDetallesAlumnadoScreen(),
        "contacto_detalles_alumnado_screen": (BuildContext context) =>
            ContactoDetallesAlumnadoScreen(),
        "servicio_screen": (BuildContext context) => ServicioScreen(),
        "servicio_es_screen": (BuildContext context) => ServicioESScreen(),
        "servicio_es_alumnos_screen": (BuildContext context) =>
            ServicioESAlumnosScreen(),
        "servicio_informes_screen": (BuildContext context) =>
            ServicioInformesScreen(),
        "servicio_informes_detalles_screen": (BuildContext context) =>
            ServicioInformesDetallesScreen(),
      },
    );
  }
}
