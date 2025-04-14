import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();     // Nombre
  final TextEditingController _surnameController = TextEditingController();  // Apellidos
  final TextEditingController _emailController = TextEditingController();    // Correo
  final TextEditingController _passwordController = TextEditingController(); // Contraseña
  final TextEditingController _confirmController = TextEditingController();  // Confirmar contraseña

  bool _loading = false;

  Future<void> _registerUser() async {
    if (_passwordController.text != _confirmController.text) {
      _showMessage('Las contraseñas no coinciden');
      return;
    }

    setState(() => _loading = true);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacementNamed(context, '/login');
    } on FirebaseAuthException catch (e) {
      _showMessage('Error: ${e.message}');
    } finally {
      setState(() => _loading = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.account_circle, size: 32),
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                ),
                const SizedBox(height: 10),
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
                const Text('NOMBRE', style: TextStyle(color: Colors.orange)),
                _inputField(controller: _nameController),
                const SizedBox(height: 15),
                const Text('APELLIDOS', style: TextStyle(color: Colors.orange)),
                _inputField(controller: _surnameController),
                const SizedBox(height: 15),
                const Text('CORREO', style: TextStyle(color: Colors.orange)),
                _inputField(controller: _emailController),
                const SizedBox(height: 15),
                const Text('CONTRASEÑA', style: TextStyle(color: Colors.orange)),
                _inputField(controller: _passwordController, obscure: true),
                const SizedBox(height: 15),
                const Text('CONFIRMAR CONTRASEÑA', style: TextStyle(color: Colors.orange)),
                _inputField(controller: _confirmController, obscure: true),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: _loading ? null : _registerUser,
                    style: _buttonStyle(),
                    child: _loading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('CREAR CUENTA', style: TextStyle(fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: _buttonStyle(),
                    child: const Text('VOLVER', style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
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
