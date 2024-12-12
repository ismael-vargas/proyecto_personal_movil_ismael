import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importar FirebaseAuth
import 'package:cloud_firestore/cloud_firestore.dart'; // Importar Firestore

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user; // Variable para almacenar el usuario logueado
  String? userEmail = '';
  String? userName = '';
  String? userInitials = '';

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Cargar los datos del usuario al iniciar
  }

Future<void> _loadUserData() async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    setState(() {
      user = currentUser;
      userEmail = currentUser.email;
    });

    // Obtener datos adicionales desde la colección 'usuarios' en Firestore
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('usuarios') // Cambiado a 'usuarios'
        .doc(user!.uid)
        .get();

    if (userDoc.exists) {
      String firstName = userDoc['nombres'] ?? ''; // Campo 'nombres' en Firestore
      String lastName = userDoc['apellidos'] ?? ''; // Campo 'apellidos' en Firestore

      setState(() {
        userName = '${firstName.isNotEmpty ? firstName : 'Usuario'} ${lastName.isNotEmpty ? lastName : ''}'.trim();
        // Calcular iniciales con valores por defecto
        userInitials = '${firstName.isNotEmpty ? firstName[0] : 'U'}${lastName.isNotEmpty ? lastName[0] : 'S'}'
            .toUpperCase();
      });
    } else {
      // Manejar el caso cuando no existe el documento
      setState(() {
        userName = 'Usuario';
        userInitials = 'US';
      });
    }
  }
}

  // Función para cerrar sesión
  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login'); // Redirige a Login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App de Cotizaciones"),
        backgroundColor: const Color(0xFFF47B00), // Naranja predominante
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header del Drawer
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFF47B00), // Fondo naranja
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Text(
                      userInitials ?? 'US', // Mostrar las iniciales del nombre
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF47B00), // Color naranja para las iniciales
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Roboto', // Fuente Roboto Regular desde assets
                    ),
                  ),
                  Text(
                    userEmail ?? 'usuario@app.com', // Mostrar el correo del usuario
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontFamily: 'Roboto-Regular', // Fuente Roboto Regular desde assets
                    ),
                  ),
                ],
              ),
            ),

            // Menús
            ListTile(
              leading: const Icon(Icons.person, color: Color(0xFFF47B00)),
              title: const Text(
                "Perfil",
                style: TextStyle(fontFamily: 'Roboto-Regular'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/perfil'); // Redirigir a Perfil
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline, color: Color(0xFFF47B00)),
              title: const Text(
                "Descripción del Proyecto",
                style: TextStyle(fontFamily: 'Roboto-Regular'),
              ),
              onTap: () {
                Navigator.pushNamed(context,
                    '/descripcion_proyecto'); // Redirigir a Descripción del Proyecto
              },
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on, color: Color(0xFFF47B00)),
              title: const Text(
                "Motocicletas de ventas",
                style: TextStyle(fontFamily: 'Roboto-Regular'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/cotizacion'); // Redirigir a Cotización
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Color(0xFFF47B00)),
              title: const Text(
                "Nuestra Ubicación",
                style: TextStyle(fontFamily: 'Roboto-Regular'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/ubicacion'); // Redirigir a Ubicación
              },
            ),
            // Nuevo menú: Carrito
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Color(0xFFF47B00)),
              title: const Text(
                "Monto total ventas",
                style: TextStyle(fontFamily: 'Roboto-Regular'),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/carrito'); // Redirigir a Carrito
              },
            ),
            Divider(), // Línea divisoria
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Cerrar Sesión",
                style: TextStyle(fontFamily: 'Roboto-Regular'),
              ),
              onTap: () {
                _signOut(); // Cerrar sesión
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono de la moto más grande y centrado
            const Icon(
              Icons.motorcycle,
              color: Color(0xFFF47B00),
              size: 100, // Hicimos el icono más grande
            ),
            const SizedBox(height: 20),
            // Texto de bienvenida
            Text(
              "Bienvenido a la App de Cotizaciones de Motos",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF47B00),
                fontFamily: 'Roboto', // Fuente Roboto Regular desde assets
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Información adicional (en la pantalla principal)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "En esta app podrás obtener cotizaciones para motos de diferentes marcas y modelos. Además, podrás gestionar tus cotizaciones, ubicar nuestros puntos de venta y más.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
