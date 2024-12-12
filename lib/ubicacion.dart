import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UbicacionScreen extends StatelessWidget {
  const UbicacionScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> sucursales = const [
    {
      'nombre': 'Sucursal 1',
      'direccion': 'Calle Ejemplo 123, Ciudad',
      'telefono': '(123) 456-7890',
      'correo': 'sucursal1@example.com',
      'horario': 'Lunes a Viernes: 9:00 AM - 6:00 PM',
    },
    {
      'nombre': 'Sucursal 2',
      'direccion': 'Avenida Ficticia 456, Ciudad',
      'telefono': '(321) 654-0987',
      'correo': 'sucursal2@example.com',
      'horario': 'Lunes a Viernes: 9:00 AM - 6:00 PM',
    },
  ];

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            // Información de contacto
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.phone, color: Colors.green),
                const SizedBox(width: 10),
                const Text(
                  '+593 962 658 076',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.envelope, color: Colors.red),
                const SizedBox(width: 10),
                const Text(
                  'iwz.vargas@yavirac.edu.ec',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Nuestras Sucursales',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: sucursales.length,
                itemBuilder: (context, index) {
                  final sucursal = sucursales[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.store, color: Colors.blue),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  sucursal['nombre']!,
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Dirección: ${sucursal['direccion']}',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.phone, color: Colors.green),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Teléfono: ${sucursal['telefono']}',
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.email, color: Colors.red),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Correo: ${sucursal['correo']}',
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.access_time, color: Colors.orange),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Horario: ${sucursal['horario']}',
                                  softWrap: true,
                                ),
                              ),
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
