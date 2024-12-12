import 'package:flutter/material.dart';
import 'cotizacion.dart'; 


class DescripcionProyectoScreen extends StatelessWidget {
  const DescripcionProyectoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Descripción del Proyecto',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFF47B00), // Naranja característico
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen o icono principal
            Icon(
              Icons.motorcycle,
              color: Color(0xFFF47B00),
              size: 100.0,
            ),
            const SizedBox(height: 20),
            // Título de la descripción
            const Text(
              'Proyecto de Cotización de Motos',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333), // Color oscuro para el texto
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Descripción del proyecto
            const Text(
              'Este es un proyecto básico de aplicación móvil para cotizar motocicletas. El objetivo es proporcionar a los usuarios una plataforma sencilla y eficiente para solicitar cotizaciones de motos y ver detalles sobre los modelos disponibles.',
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF555555), // Color gris para el texto
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Detalles adicionales
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFFF3E0),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Características del Proyecto:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF47B00),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Solicitud de cotizaciones de motos\n'
                    '• Visualización de detalles de modelos\n'
                    '• Gestión de usuarios y cotizaciones\n'
                    '• Plataforma intuitiva y fácil de usar',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF555555),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Botón de acción
ElevatedButton(
  onPressed: () {
    // Navegar a la pantalla de cotización
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CotizacionScreen()), // Aquí CotizacionScreen es la clase de la pantalla cotizacion.dart
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 255, 179, 128), // Naranja para el botón
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  child: const Text(
    'Solicitar Cotización',
    style: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}
