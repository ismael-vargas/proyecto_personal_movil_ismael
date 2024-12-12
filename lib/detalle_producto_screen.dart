import 'package:flutter/material.dart';
import 'producto.dart'; // Asegúrate de importar la clase Producto.

class DetalleProductoScreen extends StatelessWidget {
  final Producto producto;

  DetalleProductoScreen({required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Producto'),
        backgroundColor: Colors.orange,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagen del producto (más grande)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  producto.imagen,
                  width: 250,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),

              // Nombre del producto
              Text(
                producto.nombre,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),

              // Descripción
              Text(
                producto.descripcion,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Características del producto
              const Divider(thickness: 1),
              const Text(
                'Características:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              for (var caracteristica in producto.caracteristicas)
                Text(
                  '• $caracteristica',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              const SizedBox(height: 30),

              // Información adicional (Motor, Potencia, Transmisión, etc.)
              const Divider(thickness: 1),
              const Text(
                'Información Técnica:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Cilindraje
              _buildInfoRow(Icons.settings, 'Cilindraje', '776 cc'),
              _buildInfoRow(Icons.speed, 'Potencia', '82 HP'),
              _buildInfoRow(Icons.swap_horiz, 'Transmisión', '6 Velocidades'),
              _buildInfoRow(Icons.engineering, 'Tipo Motor', '4 Tiempos'),
              _buildInfoRow(Icons.filter_list, 'Número de Cilindros', '2 Cilindros en línea, 8 válvulas'),
              _buildInfoRow(Icons.ac_unit, 'Sistema de Refrigeración', 'Líquida'),
              _buildInfoRow(Icons.bolt, 'Sistema de Alimentación', 'Inyección'),
              _buildInfoRow(Icons.power, 'Sistema de Arranque', 'Eléctrico'),

              const SizedBox(height: 30),

              // Botones de acción
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    icon: const Icon(Icons.arrow_back, size: 20),
                    label: const Text(
                      'Volver a la Cotización',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: () {
                      // Lógica para añadir al carrito
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, // Morado oscuro
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size(200, 50), // Igual tamaño que el otro botón
                    ),
                    icon: const Icon(Icons.shopping_cart, size: 20, color: Colors.white),
                    label: const Text(
                      'Añadir a Carrito',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para mostrar filas de información con iconos
  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$title: ',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
