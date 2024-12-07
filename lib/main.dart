import 'package:flutter/material.dart';
import 'login.dart'; // Pantalla de login
import 'home.dart'; // Pantalla principal (MainScreen)
import 'bienvenidad.dart'; // Pantalla de bienvenida
import 'perfil.dart'; // Nueva pantalla Perfil
import 'descripcion_proyecto.dart'; // Nueva pantalla Descripción del Proyecto
import 'cotizacion.dart'; // Nueva pantalla Cotización
import 'ubicacion.dart'; // Nueva pantalla Ubicación

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Login',
      theme: ThemeData(
        primarySwatch: Colors.orange, // Establece un color de tema principal
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/bienvenida', // Cambia la ruta inicial a la pantalla de bienvenida
      routes: {
        '/': (context) => const LoginScreen(), // Pantalla de login
        '/home': (context) => const MainScreen(), // Pantalla principal
        '/bienvenida': (context) => const BienvenidaScreen(), // Pantalla de bienvenida
        '/perfil': (context) => const PerfilScreen(), // Ruta para la pantalla de perfil
        '/descripcion_proyecto': (context) => const DescripcionProyectoScreen(), // Ruta para la pantalla de descripción
        '/cotizacion': (context) => CotizacionScreen(),
        '/ubicacion': (context) => const UbicacionScreen(), // Ruta para la pantalla de ubicación
      },
    );
  }
}
