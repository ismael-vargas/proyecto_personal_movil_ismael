import 'package:flutter/material.dart';
import 'detalle_producto_screen.dart';
import 'producto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CotizacionScreen extends StatefulWidget {
  @override
  _CotizacionScreenState createState() => _CotizacionScreenState();
}

class _CotizacionScreenState extends State<CotizacionScreen> {
  final List<Producto> _productos = [
    Producto(
      id: '1',
      nombre: 'Suzuki GN 125',
      precio: 448.99,
      imagen: 'images/gn125.png',
      descripcion: 'Motocicleta ideal para principiantes.',
      caracteristicas: ['Motor 124cc', 'Velocidad máxima: 110 km/h', 'Peso: 120 kg'],
    ),
    Producto(
      id: '2',
      nombre: 'Suzuki GS 125',
      precio: 1298.99,
      imagen: 'images/ax125.jpg',
      descripcion: 'Una moto versátil con un buen rendimiento.',
      caracteristicas: ['Motor 125cc', 'Velocidad máxima: 115 km/h', 'Peso: 130 kg'],
    ),
    Producto(
      id: '3',
      nombre: 'Moto Suzuki Ax125',
      precio: 900.0,
      imagen: 'images/so125.png',
      descripcion: 'Moto ligera y fácil de maniobrar.',
      caracteristicas: ['Motor 125cc', 'Velocidad máxima: 100 km/h', 'Peso: 110 kg'],
    ),
    Producto(
      id: '4',
      nombre: 'Suzuki GSX 125',
      precio: 650.0,
      imagen: 'images/ui120.png',
      descripcion: 'Moto deportiva y compacta.',
      caracteristicas: ['Motor 125cc', 'Velocidad máxima: 120 km/h', 'Peso: 125 kg'],
    ),
    Producto(
      id: '5',
      nombre: 'Suzuki GS 500',
      precio: 2300.0,
      imagen: 'images/gs500.png',
      descripcion: 'Moto potente para viajes largos.',
      caracteristicas: ['Motor 500cc', 'Velocidad máxima: 160 km/h', 'Peso: 200 kg'],
    ),
    Producto(
      id: '6',
      nombre: 'Suzuki EN 125',
      precio: 750.0,
      imagen: 'images/en125.jpg',
      descripcion: 'Moto económica para uso diario.',
      caracteristicas: ['Motor 125cc', 'Velocidad máxima: 110 km/h', 'Peso: 130 kg'],
    ),
    Producto(
      id: '7',
      nombre: 'Suzuki Vstrom 250',
      precio: 4100.0,
      imagen: 'images/vstrom.jpg',
      descripcion: 'Ideal para aventuras largas en carretera.',
      caracteristicas: ['Motor 250cc', 'Velocidad máxima: 130 km/h', 'Peso: 180 kg'],
    ),
  ];

  double _totalPrecio = 0.0;

  @override
  void initState() {
    super.initState();
    _cargarMeGusta();
    _cargarCarrito(); // Cargar el carrito al iniciar la pantalla
  }

  // Método para guardar "me gusta" en SharedPreferences
  Future<void> _guardarMeGusta(String productoId, bool meGusta) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> meGustaIds = prefs.getStringList('meGusta') ?? [];
    if (meGusta) {
      if (!meGustaIds.contains(productoId)) {
        meGustaIds.add(productoId);  // Añadir el producto al "me gusta"
      }
    } else {
      meGustaIds.remove(productoId);  // Remover el producto de "me gusta"
    }
    await prefs.setStringList('meGusta', meGustaIds);  // Guardar la lista de productos "me gusta"
  }

  // Método para obtener los "me gusta"
  Future<void> _cargarMeGusta() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> meGustaIds = prefs.getStringList('meGusta') ?? [];
    setState(() {
      // Actualizar los productos según si están en la lista de "me gusta"
      for (var producto in _productos) {
        producto.meGusta = meGustaIds.contains(producto.id);
      }
    });
  }

  // Guardar productos en el carrito
  Future<void> _guardarEnCarrito(String productoId, bool enCarrito) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> carritoIds = prefs.getStringList('carrito') ?? [];
    if (enCarrito) {
      if (!carritoIds.contains(productoId)) {
        carritoIds.add(productoId);
      }
    } else {
      carritoIds.remove(productoId);
    }
    await prefs.setStringList('carrito', carritoIds);
  }

  // Cargar productos en el carrito al iniciar
  Future<void> _cargarCarrito() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> carritoIds = prefs.getStringList('carrito') ?? [];
    setState(() {
      for (var producto in _productos) {
        producto.enCarrito = carritoIds.contains(producto.id);
      }
    });
  }

  // Método para simular el cálculo de la cotización
  Future<void> _agregarAlCarrito(Producto producto) async {
    setState(() {
      producto.enCarrito = !producto.enCarrito;
      if (producto.enCarrito) {
        _totalPrecio += producto.precio;
      } else {
        _totalPrecio -= producto.precio;
      }
    });

    // Guardar en SharedPreferences
    _guardarEnCarrito(producto.id, producto.enCarrito);

    // Simular un pequeño retraso para calcular
    await Future.delayed(const Duration(seconds: 1));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(producto.enCarrito
          ? 'Producto añadido al carrito.'
          : 'Producto eliminado del carrito.'),
    ));
  }

  // Método para ver los detalles del producto
  void _verDetalles(Producto producto) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleProductoScreen(producto: producto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotización', style: TextStyle(fontWeight: FontWeight.bold)),
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
                      child: Column(
                        children: [
                          ListTile(
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
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Precio: \$${producto.precio.toStringAsFixed(2)}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  producto.descripcion,
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    producto.meGusta
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: producto.meGusta ? Colors.red : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      producto.meGusta = !producto.meGusta;
                                      _guardarMeGusta(producto.id, producto.meGusta);
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  color: producto.enCarrito ? Colors.green : Colors.grey,
                                  onPressed: () {
                                    _agregarAlCarrito(producto);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                _verDetalles(producto);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                minimumSize: const Size(double.infinity, 40),
                              ),
                              icon: const Icon(Icons.info, size: 18),
                              label: const Text('Ver Más Información'),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
