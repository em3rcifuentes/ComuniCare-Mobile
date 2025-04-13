// Importa los componentes visuales del framework Flutter
import 'package:flutter/material.dart';
import '../counter_decision.dart'; // Importa el sistema de contador

// Widget principal de la pantalla del módulo Baño
class BathroomScreen extends StatelessWidget {
  const BathroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Evita que los contenidos choquen con la barra de estado o notch
      child: Scaffold(
        body: Container(
          // Fondo con gradiente de azul a verde
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFADE8F4), Color(0xFFCAF7A1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 30), // Espacio superior

              // Título principal de la pantalla
              const Text(
                '¿VAMOS AL BAÑO?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF9A825), // Naranja
                ),
              ),

              const SizedBox(height: 30), // Espacio entre título y opciones

              // Cuadrícula de 2x2 con opciones del módulo baño
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    crossAxisCount: 2, // Número de columnas
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: const [
                      BathroomOption(
                        imagePath: 'assets/images/diente.webp',
                        label: 'DIENTES',
                      ),
                      BathroomOption(
                        imagePath: 'assets/images/manos.webp',
                        label: 'MANOS',
                      ),
                      BathroomOption(
                        imagePath: 'assets/images/pipi.webp',
                        label: 'PIPI',
                      ),
                      BathroomOption(
                        imagePath: 'assets/images/popo.webp',
                        label: 'POPO',
                      ),
                    ],
                  ),
                ),
              ),

              // Botón "Volver" abajo
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFC107), // Amarillo
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Vuelve a la pantalla anterior
                  },
                  child: const Text(
                    'volver',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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

// Widget personalizado reutilizable para cada botón de opción del baño
class BathroomOption extends StatelessWidget {
  final String imagePath; // Ruta de la imagen a mostrar
  final String label;     // Texto a mostrar debajo de la imagen

  const BathroomOption({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Aumenta el contador de uso del módulo baño
        CounterDecision.instance.incrementBathroom();

        // Mostrar un mensaje corto al seleccionar una opción
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Seleccionaste: $label')),
        );

        // Redirigir a pantalla de decisión luego de un breve retardo
        Future.delayed(const Duration(milliseconds: 800), () {
          Navigator.pushNamed(context, '/decision');
        });
      },
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imagePath, // Muestra la imagen asociada a la opción
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFFF9A825), // Color del texto
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
