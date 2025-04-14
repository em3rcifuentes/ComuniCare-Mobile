import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController(); 
  final TextEditingController _passwordController = TextEditingController(); 

  bool _loading = false;

  Future<void> _loginUser() async {
    setState(() => _loading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacementNamed(context, '/decision');
    } on FirebaseAuthException catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message}')),
      );
    } finally {
      setState(() => _loading = false);
    }
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.account_circle, size: 32),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 10),
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
              const Text('CORREO', style: TextStyle(color: Colors.orange)),
              _inputField(controller: _emailController),
              const SizedBox(height: 15),
              const Text('CONTRASEÑA', style: TextStyle(color: Colors.orange)),
              _inputField(controller: _passwordController, obscure: true),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿NO TIENES CUENTA? ', style: TextStyle(color: Colors.orange)),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/register'),
                      child: const Text(
                        'REGÍSTRATE AQUÍ',
                        style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: _loading ? null : _loginUser,
                  style: _buttonStyle(),
                  child: _loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('INGRESA'),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
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

  Widget _inputField({required TextEditingController controller, bool obscure = false}) {
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
