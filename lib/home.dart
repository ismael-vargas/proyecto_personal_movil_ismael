import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Suponiendo que el correo del usuario se pasa como un parámetro o se obtiene de alguna forma
    String? userEmail = 'usuario@app.com'; // Puedes modificar esto para obtener el email real

    // Puedes cambiar esta imagen por la URL de la imagen de perfil del usuario
    String userProfileImage = ''; // Asegúrate de usar una URL válida

    // Si la imagen no está disponible, usaremos las iniciales
    String userInitials = 'US'; // Las iniciales del usuario

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
              backgroundImage: userProfileImage.isNotEmpty 
                  ? NetworkImage(userProfileImage) 
                  : null,
              child: userProfileImage.isEmpty
                  ? Text(
                      userInitials,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  : null,
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
          Navigator.pushNamed(context, '/descripcion_proyecto'); // Redirigir a Descripción del Proyecto
        },
      ),
      ListTile(
        leading: const Icon(Icons.monetization_on, color: Color(0xFFF47B00)),
        title: const Text(
          "Cotizar Moto",
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
      Divider(), // Línea divisoria
      ListTile(
        leading: const Icon(Icons.logout, color: Colors.red),
        title: const Text(
          "Cerrar Sesión",
          style: TextStyle(fontFamily: 'Roboto-Regular'),
        ),
        onTap: () {
          // Cerrar sesión
          Navigator.pop(context);
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
          ],
        ),
      ),
    );
  }
}
