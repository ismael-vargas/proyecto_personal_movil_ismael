class Producto {
  final String id;
  final String nombre;
  final double precio;
  final String imagen;
  final String descripcion;
  final List<String> caracteristicas;
  bool meGusta;      // Propiedad para "me gusta"
  bool enCarrito;    // Propiedad para "en carrito"

  Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.imagen,
    required this.descripcion,
    required this.caracteristicas,
    this.meGusta = false,     // Valor por defecto
    this.enCarrito = false,   // Valor por defecto
  });
}
