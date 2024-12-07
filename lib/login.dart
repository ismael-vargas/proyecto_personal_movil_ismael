import 'package:flutter/material.dart';
import 'home.dart'; // Asegúrate de que esta pantalla exista
import 'registro.dart'; // Asegúrate de que esta pantalla exista

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        backgroundColor: const Color.fromARGB(255, 247, 148, 1),
      ),
      body: Container(
        color: const Color(0xFFFFE0B2), // Fondo naranja claro
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Imagen de motocicleta
                SizedBox(
                  height: 145,
                  width: 260,
                  child: Image.asset(
                    'images/750.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),

                // Texto de bienvenida con fuente Roboto
                const Text(
                  'Bienvenido de nuevo',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF47B00),
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // Campo de usuario con ícono y fuente Roboto
                TextField(
                  style: const TextStyle(fontFamily: 'Roboto'),
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    labelStyle: const TextStyle(fontFamily: 'Roboto'),
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Campo de contraseña con ícono y fuente Roboto
                TextField(
                  style: const TextStyle(fontFamily: 'Roboto'),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(fontFamily: 'Roboto'),
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Botones "Iniciar sesión", "Registrar" y "Salir"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Aquí iría la lógica de inicio de sesión
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(), // Redirige a la pantalla principal (MainScreen)
                          ),
                        );
                      },
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: 'Roboto'),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        side: const BorderSide(color: Colors.orange),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistroScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Registrar',
                        style: TextStyle(fontSize: 18, color: Colors.orange, fontFamily: 'Roboto'),
                      ),
                    ),
                    // Botón Salir
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Cerrar la pantalla actual
                      },
                      child: const Text(
                        'Salir',
                        style: TextStyle(fontSize: 18, color: Colors.red, fontFamily: 'Roboto'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
