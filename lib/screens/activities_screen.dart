// Importa el paquete de Flutter que permite construir la interfaz
import 'package:flutter/material.dart';
import '../counter_decision.dart'; // Importa el archivo del contador

// Pantalla principal para el módulo de actividades
class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Asegura que los elementos no se oculten bajo la barra de estado
      child: Scaffold(
        body: Container(
          // Fondo con gradiente vertical de azul claro a verde claro
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFADE8F4), Color(0xFFCAF7A1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 30), // Espaciado superior

              // Título de la pantalla
              const Text(
                'VAMOS A DIVERTIRNOS',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF9A825), // Naranja vibrante
                ),
              ),

              const SizedBox(height: 30), // Espacio debajo del título

              // Cuadrícula 2x2 con botones de actividades
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    crossAxisCount: 2, // Dos columnas
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: const [
                      ActivityButton(
                        imagePath: 'assets/images/pintar.webp',
                        label: 'PINTAR',
                      ),
                      ActivityButton(
                        imagePath: 'assets/images/actividad.webp',
                        label: 'JUGAR',
                      ),
                      ActivityButton(
                        imagePath: 'assets/images/bicicleta.webp',
                        label: 'BICICLETA',
                      ),
                      ActivityButton(
                        imagePath: 'assets/images/leer.webp',
                        label: 'LEER',
                      ),
                    ],
                  ),
                ),
              ),

              // Botón para volver a la pantalla anterior
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFC107), // Color amarillo
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Regresa a la pantalla anterior
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget reutilizable que representa un botón con imagen + texto para cada actividad
class ActivityButton extends StatelessWidget {
  final String imagePath; // Ruta de la imagen
  final String label;     // Texto descriptivo

  const ActivityButton({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Incrementa el contador del módulo Actividades
        CounterDecision.instance.incrementActivities();

        // Muestra un mensaje con el nombre de la actividad seleccionada
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Seleccionaste $label')),
        );

        // Después de 800 ms, navega automáticamente a la pantalla de decisión
        Future.delayed(const Duration(milliseconds: 800), () {
          Navigator.pushNamed(context, '/decision');
        });
      },
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imagePath, // Muestra la imagen desde assets
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label, // Nombre de la actividad
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFFF9A825),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
