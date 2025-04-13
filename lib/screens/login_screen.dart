import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

              // Icono de usuario en la parte superior izquierda
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.account_circle, size: 32),
                  onPressed: () {}, // Puedes enlazar con perfil u otra acción
                ),
              ),

              const SizedBox(height: 10),

              // Título de la pantalla
              const Center(
                child: Text(
                  'INICIAR SESIÓN',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Campo: Correo
              const Text('CORREO', style: TextStyle(color: Colors.orange)),
              _inputField(),

              const SizedBox(height: 15),

              // Campo: Contraseña
              const Text('CONTRASEÑA', style: TextStyle(color: Colors.orange)),
              _inputField(obscure: true),

              const SizedBox(height: 20),

              // Texto de registro
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿NO TIENES CUENTA? ',
                      style: TextStyle(color: Colors.orange),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'REGÍSTRATE AQUÍ',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Botón: Ingresar
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Aquí irá la lógica de validación de login
                    Navigator.pushNamed(context, '/decision');
                  },
                  style: _buttonStyle(),
                  child: const Text('INGRESA'),
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
                  child: const Text('VOLVER'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Campo de entrada reutilizable
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

  // Estilo de botón reutilizable
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
