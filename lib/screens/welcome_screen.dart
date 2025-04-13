import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Protege contenido de cámaras, barras, etc.
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,

          // Fondo con gradiente azul a verde claro
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFA6DCEF), Color(0xFFC8FACC)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Parte superior con íconos
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icono de usuario (futuro acceso a perfil o login)
                    IconButton(
                      icon: const Icon(Icons.account_circle, size: 32),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),

                    // Icono de configuración (a futuro)
                    IconButton(
                      icon: const Icon(Icons.settings, size: 32),
                      onPressed: () {
                        // Implementar navegación si se desea
                      },
                    ),
                  ],
                ),
              ),

              // Título y subtítulo
              Column(
                children: const [
                  Text(
                    '“ComuniCare”',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Descubre, Juega y Aprende!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              // Botón "COMENZAR"
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/decision'); // Navega al menú principal
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    'COMENZAR!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
