import 'package:flutter/material.dart';

class Producto {
  final String nombre;
  final double precio;
  final String imagen; // Imagen del producto
  int cantidad;

  Producto({
    required this.nombre,
    required this.precio,
    required this.imagen,
    this.cantidad = 1,
  });

  double get total => precio * cantidad;
}

class CotizacionScreen extends StatefulWidget {
  @override
  _CotizacionScreenState createState() => _CotizacionScreenState();
}

class _CotizacionScreenState extends State<CotizacionScreen> {
  final List<Producto> _productos = [
    Producto(
        nombre: 'Suzuki Gn 125',
        precio: 448.99,
        imagen: 'images/gn125.png'),
    Producto(
        nombre: 'Suzuki Gs 125',
        precio: 1298.99,
        imagen: 'images/ax125.jpg'),
    Producto(
        nombre: 'Moto Suzuki Ax125',
        precio: 900.0,
        imagen: 'images/so125.png'),
    Producto(
        nombre: 'Suzuki Gsx 125',
        precio: 650.0,
        imagen: 'images/ui120.png'),
    Producto(
        nombre: 'Suzuki Gs 500',
        precio: 2300.0,
        imagen: 'images/gs500.png'), // Producto agregado
  ];

  final List<Producto> _productosSeleccionados = [];

  double get _totalCotizacion {
    return _productosSeleccionados.fold(0, (sum, item) => sum + item.total);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cotización',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        elevation: 5,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Lista de productos disponibles
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: _productos.length,
                  itemBuilder: (context, index) {
                    final producto = _productos[index];
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
                              producto.imagen,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        title: Text(
                          producto.nombre,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Precio: \$${producto.precio.toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _productosSeleccionados.add(producto);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.add, size: 18),
                          label: const Text(
                            'Añadir',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Resumen del total
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Cotización:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${_totalCotizacion.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Mostrar factura detallada
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Factura Detallada',
                              style: TextStyle(color: Colors.orange),
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _productosSeleccionados
                                    .map(
                                      (producto) => Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                                        child: Text(
                                          '${producto.nombre} - \$${producto.precio.toStringAsFixed(2)}',
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Aceptar',
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.receipt, size: 18),
                    label: const Text(
                      'Generar Cotización',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
