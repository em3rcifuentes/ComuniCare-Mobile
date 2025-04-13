// Importa los componentes visuales del framework Flutter
import 'package:flutter/material.dart';
import '../counter_decision.dart'; // Importa el archivo del contador

// Pantalla de emociones del usuario
class EmotionScreen extends StatelessWidget {
  const EmotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Evita que el contenido se superponga a las áreas del sistema (notch, barra de estado)
      child: Scaffold(
        body: Container(
          // Fondo con gradiente vertical de azul claro a verde
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFADE8F4), Color(0xFFCAF7A1)],
            ),
          ),
          child: Column( // Organiza los elementos de arriba hacia abajo
            children: [
              const SizedBox(height: 30), // Espacio superior

              // Título principal de la pantalla
              const Text(
                '¿COMO TE SIENTES?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF9A825), // Naranja vibrante
                ),
              ),

              const SizedBox(height: 30), // Espacio entre título y cuadrícula

              // Cuadrícula de emociones en 2 columnas
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    crossAxisCount: 2, // Número de columnas
                    crossAxisSpacing: 16, // Espaciado horizontal entre tarjetas
                    mainAxisSpacing: 16,  // Espaciado vertical entre tarjetas
                    children: const [ // Lista de botones de emociones
                      EmotionButton(
                        imagePath: 'assets/images/feliz.webp',
                        label: 'FELIZ',
                      ),
                      EmotionButton(
                        imagePath: 'assets/images/triste.webp',
                        label: 'TRISTE',
                      ),
                      EmotionButton(
                        imagePath: 'assets/images/enojo.webp',
                        label: 'ENOJO',
                      ),
                      EmotionButton(
                        imagePath: 'assets/images/miedo.webp',
                        label: 'MIEDO',
                      ),
                    ],
                  ),
                ),
              ),

              // Botón "Volver"
              Padding(
                padding: const EdgeInsets.only(bottom: 30), // Espacio inferior
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFC107), // Color amarillo vibrante
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 5, // Sombra del botón
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Vuelve a la pantalla anterior
                  },
                  child: const Text(
                    'volver',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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

// Widget personalizado para cada botón de emoción
class EmotionButton extends StatelessWidget {
  final String imagePath; // Ruta a la imagen de la emoción
  final String label;     // Nombre de la emoción (ej. FELIZ)

  const EmotionButton({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Incrementa el contador de emociones
        CounterDecision.instance.incrementEmotions();

        // Muestra un mensaje al tocar el botón
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Te sientes $label')),
        );

        // Regresa automáticamente a la pantalla de decisión tras un breve retardo
        Future.delayed(const Duration(milliseconds: 800), () {
          Navigator.pushNamed(context, '/decision');
        });
      },
      child: Column(
        children: [
          // Imagen de la emoción (ocupa la mayor parte del espacio disponible)
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8), // Espacio entre imagen y texto
          // Texto de la emoción
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFFF9A825), // Naranja vibrante
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
