import 'package:flutter/material.dart';

class CarritoScreen extends StatelessWidget {
  const CarritoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, dynamic>> productosCarrito = [
      {
        'nombre': 'Suzuki GN 125',
        'precio': 448.99,
        'imagen': 'images/gn125.png',
        'cantidad': 1,
      },
      {
        'nombre': 'Suzuki GS 125',
        'precio': 1298.99,
        'imagen': 'images/ax125.jpg',
        'cantidad': 2,
      },
      {
        'nombre': 'Moto Suzuki Ax125',
        'precio': 900.0,
        'imagen': 'images/so125.png',
        'cantidad': 1,
      },
    ];

    // Calcular el total de la cotización
    double total = 0.0;
    for (var producto in productosCarrito) {
      total += (producto['precio'] as double) * (producto['cantidad'] as int);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            const Text(
              'Productos en tu carrito:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Lista de productos
            Expanded(
              child: ListView.builder(
                itemCount: productosCarrito.length,
                itemBuilder: (context, index) {
                  final producto = productosCarrito[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade200,
                        ),
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset(
                            producto['imagen']!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      title: Text(
                        producto['nombre']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Cantidad: ${producto['cantidad']} - Precio: \$${producto['precio']!.toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.black54),
                      ),
                      trailing: Text(
                       '\$${((producto['precio'] as double) * (producto['cantidad'] as int)).toStringAsFixed(2)}',

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Total
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            // Botón para proceder a la compra
            Center(
              child: ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Proceder a la compra',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
