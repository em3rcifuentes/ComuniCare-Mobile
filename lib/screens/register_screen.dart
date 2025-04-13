import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFA6DCEF), Color(0xFFC8FACC)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Icono de usuario en la esquina superior
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.account_circle, size: 32),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Título
              const Center(
                child: Text(
                  'CREAR CUENTA',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Campo: Nombre
              const Text('NOMBRE', style: TextStyle(color: Colors.orange)),
              _inputField(),

              // Campo: Apellidos
              const SizedBox(height: 15),
              const Text('APELLIDOS', style: TextStyle(color: Colors.orange)),
              _inputField(),

              // Campo: Correo
              const SizedBox(height: 15),
              const Text('CORREO', style: TextStyle(color: Colors.orange)),
              _inputField(),

              // Campo: Contraseña
              const SizedBox(height: 15),
              const Text('CONTRASEÑA', style: TextStyle(color: Colors.orange)),
              _inputField(obscure: true),

              // Campo: Confirmar contraseña
              const SizedBox(height: 15),
              const Text('CONFIRMAR CONTRASEÑA', style: TextStyle(color: Colors.orange)),
              _inputField(obscure: true),

              const SizedBox(height: 40),

              // Botón: Crear cuenta
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Aquí iría la lógica de registro
                  },
                  style: _buttonStyle(),
                  child: const Text(
                    'CREAR CUENTA',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Botón: Volver
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: _buttonStyle(),
                  child: const Text(
                    'VOLVER',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para los campos de entrada
  Widget _inputField({bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Estilo compartido para botones
  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.amber,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4,
    );
  }
}
