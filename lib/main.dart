import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Importa el archivo de configuración de Firebase

import 'login.dart'; // Pantalla de login
import 'home.dart'; // Pantalla principal (MainScreen)
import 'bienvenidad.dart'; // Pantalla de bienvenida
import 'perfil.dart'; // Nueva pantalla Perfil
import 'descripcion_proyecto.dart'; // Nueva pantalla Descripción del Proyecto
import 'cotizacion.dart'; // Nueva pantalla Cotización
import 'ubicacion.dart'; // Nueva pantalla Ubicación
import 'carrito.dart'; // Importa la pantalla Carrito

void main() async {
  // Asegúrate de que la inicialización de widgets esté lista antes de usar Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase con las opciones correspondientes de la plataforma
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Usa la configuración generada por FlutterFire CLI
  );

  // Luego ejecuta la aplicación
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
        '/login': (context) => const LoginScreen(), // Alias para pantalla de login
        '/home': (context) => const HomeScreen(), // Aquí es HomeScreen
        '/bienvenida': (context) => const BienvenidaScreen(), // Pantalla de bienvenida
        '/perfil': (context) => const PerfilScreen(), // Ruta para la pantalla de perfil
        '/descripcion_proyecto': (context) => const DescripcionProyectoScreen(), // Ruta para la pantalla de descripción
        '/cotizacion': (context) => CotizacionScreen(), // Ruta para la pantalla de cotización
        '/ubicacion': (context) => const UbicacionScreen(), // Ruta para la pantalla de ubicación
        '/carrito': (context) => const CarritoScreen(), // Ruta para la pantalla del carrito
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      },
    );
  }
}
