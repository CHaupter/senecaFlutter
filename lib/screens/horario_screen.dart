import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca_aplicacion/providers/providers.dart';

class HorarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final centroProvider = Provider.of<CentroProvider>(context);
    final listadoProfesores = centroProvider.listaProfesores;
    return Scaffold(
      appBar: AppBar(
        title: Text("HORARIO"),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
              itemCount: listadoProfesores.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return GestureDetector(
                      onTap: () {
                        null;
                      },
                      child: Container());
                } else {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "horario_prof_screen",
                          arguments: index);
                    },
                    child: ListTile(
                      title: Text(listadoProfesores[index].nombre),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}
