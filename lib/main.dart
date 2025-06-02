import 'package:flutter/material.dart';
import 'package:myapp/form_clientes.dart';
import 'package:myapp/form_empleados.dart';
import 'package:myapp/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    routes: {
     "/home": (context) => HomePage(),
      "/clientes": (context) => MyForm(),
      "/empleados": (context) => FormEmpleados(),


    },
    );
  }
}

