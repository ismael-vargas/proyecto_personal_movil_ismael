import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UbicacionScreen extends StatelessWidget {
  const UbicacionScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> sucursales = const [
    {
      'nombre': 'Sucursal 1',
      'direccion': 'Calle Ejemplo 123, Ciudad',
      'telefono': '(123) 456-7890',
      'horario': 'Lunes a Viernes: 9:00 AM - 6:00 PM',
    },
    {
      'nombre': 'Sucursal 2',
      'direccion': 'Avenida Ficticia 456, Ciudad',
      'telefono': '(321) 654-0987',
      'horario': 'Lunes a Viernes: 9:00 AM - 6:00 PM',
    },
  ];

  // Función para abrir WhatsApp
  Future<void> _launchWhatsApp() async {
    const phoneNumber = '+593999999999';
    final url = 'https://wa.me/$phoneNumber';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'No se puede abrir WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuestra Ubicación'),
        backgroundColor: const Color.fromARGB(255, 243, 138, 33),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Estamos ubicados en el corazón de la ciudad',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF007BFF)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Av. 10 de Agosto N45-56, Quito, Ecuador',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _launchWhatsApp,
              icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
              label: const Text('Contáctanos en WhatsApp'),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF25D366)),
            ),
            const SizedBox(height: 40),
            const Text('Nuestras Sucursales', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: sucursales.length,
                itemBuilder: (context, index) {
                  final sucursal = sucursales[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.store, color: Colors.blue),
                              const SizedBox(width: 10),
                              Text(sucursal['nombre']!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text('Dirección: ${sucursal['direccion']}'),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.phone, color: Colors.green),
                              const SizedBox(width: 8),
                              Text('Teléfono: ${sucursal['telefono']}'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.access_time, color: Colors.orange),
                              const SizedBox(width: 8),
                              Text('Horario: ${sucursal['horario']}'),
                            ],
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
