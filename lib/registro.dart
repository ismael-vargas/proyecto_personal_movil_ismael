import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'login.dart'; // Asegúrate de que el archivo login.dart esté importado

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _genero = 'Masculino';
  String _estadoCivil = 'Soltero';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateCedula(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese su cédula';
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'La cédula debe contener exactamente 10 dígitos numéricos';
    }
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo vacío';
    } else if (value.length < 3) {
      return 'Debe tener al menos 3 letras';
    } else if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'No debe contener números';
    }
    return null;
  }

  String? _validateEdad(String? value) {
    if (value == null || value.isEmpty || int.tryParse(value) == null) {
      return 'Edad no válida';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingrese una contraseña';
    } else if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  void _calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    _edadController.text = age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5A623), // Color naranjo para el encabezado
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Vuelve a la pantalla anterior
            },
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF5A623), Color(0xFFF47B00)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Form(
                  key: _formKey, // Form Key
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('images/SUZUKIS.png'),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Regístrate ahora',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _cedulaController,
                        decoration: InputDecoration(
                          labelText: 'Cédula',
                          prefixIcon: const Icon(Icons.credit_card),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: _validateCedula,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nombresController,
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: _validateName,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _apellidosController,
                        decoration: InputDecoration(
                          labelText: 'Apellido',
                          prefixIcon: const Icon(Icons.person_outline),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: _validateName,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _fechaController,
                        decoration: InputDecoration(
                          labelText: 'Fecha de Nacimiento',
                          hintText: 'DD/MM/YYYY',
                          prefixIcon: const Icon(Icons.calendar_today),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.datetime,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _fechaController.text =
                                  DateFormat('dd/MM/yyyy').format(pickedDate);
                              _calculateAge(pickedDate);
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su fecha de nacimiento';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _edadController,
                        decoration: InputDecoration(
                          labelText: 'Edad',
                          prefixIcon: const Icon(Icons.accessibility_new),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        readOnly: true,
                        validator: _validateEdad,
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Género'),
                          ListTile(
                            title: const Text('Masculino'),
                            leading: Radio<String>(
                              value: 'Masculino',
                              groupValue: _genero,
                              onChanged: (String? value) {
                                setState(() {
                                  _genero = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Femenino'),
                            leading: Radio<String>(
                              value: 'Femenino',
                              groupValue: _genero,
                              onChanged: (String? value) {
                                setState(() {
                                  _genero = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Estado Civil con Dropdown
                      DropdownButtonFormField<String>(
                        value: _estadoCivil,
                        decoration: InputDecoration(
                          labelText: 'Estado Civil',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                              value: 'Soltero', child: Text('Soltero')),
                          DropdownMenuItem(
                              value: 'Casado', child: Text('Casado')),
                          DropdownMenuItem(
                              value: 'Divorciado', child: Text('Divorciado')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _estadoCivil = value!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor seleccione su estado civil';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Campo de Contraseña
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: const Icon(Icons.lock),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: _validatePassword,
                      ),
                      const SizedBox(height: 20),
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState?.validate() ?? false) {
      // Procesa el registro
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registro exitoso')));

      // Redirige a la pantalla de Login
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginScreen()));
    }
  },
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    backgroundColor: Colors.transparent, // Hacemos el fondo transparente para aplicar el gradiente
    elevation: 5,
    shadowColor: Colors.black.withOpacity(0.2), // Sombras suaves
  ).copyWith(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    // Añadimos un gradiente
    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
  ),
  child: Ink(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color.fromARGB(255, 20, 115, 223), Color.fromARGB(255, 20, 115, 223)], // Gradiente naranja
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Container(
      constraints: BoxConstraints(maxWidth: 200), // Límite de ancho
      alignment: Alignment.center,
      child: const Text(
        'GUARDAR',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Texto blanco
        ),
      ),
    ),
  ),
),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
