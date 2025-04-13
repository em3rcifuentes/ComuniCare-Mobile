// Importa los widgets de Flutter necesarios
import 'package:flutter/material.dart';
import '../counter_decision.dart'; // Importa el contador global

// Define un widget sin estado llamado FoodsScreen
class FoodsScreen extends StatelessWidget {
  const FoodsScreen({super.key}); // Constructor constante para mejor rendimiento

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Evita superponer contenido sobre áreas del sistema (notch, barra de estado, etc.)
      child: Scaffold( // Estructura básica de la pantalla con barra, cuerpo, etc.
        body: Container(
          // Fondo con degradado vertical de azul claro a verde
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFADE8F4), Color(0xFFCAF7A1)],
            ),
          ),
          child: Column( // Columna principal que contiene todo el contenido
            children: [
              const SizedBox(height: 30), // Espacio superior

              // Título principal de la pantalla
              const Text(
                '¿VAMOS A COMER?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF9A825), // Naranja vibrante
                ),
              ),

              const SizedBox(height: 30), // Espacio entre título y botones

              // Sección expandible que contiene las opciones en cuadrícula
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16), // Margen horizontal
                  child: GridView.count( // Cuadrícula de botones
                    crossAxisCount: 2, // 2 columnas
                    crossAxisSpacing: 16, // Espaciado horizontal
                    mainAxisSpacing: 16, // Espaciado vertical
                    children: const [ // Lista de botones
                      FoodOptionButton(
                        imagePath: 'assets/images/platocomida.webp',
                        label: 'Comida',
                      ),
                      FoodOptionButton(
                        imagePath: 'assets/images/frutas.webp',
                        label: 'Fruta',
                      ),
                      FoodOptionButton(
                        imagePath: 'assets/images/beber.webp',
                        label: 'Agua',
                      ),
                      FoodOptionButton(
                        imagePath: 'assets/images/pan.webp',
                        label: 'Pan',
                      ),
                    ],
                  ),
                ),
              ),

              // Botón de navegación para volver a la pantalla anterior
              Padding(
                padding: const EdgeInsets.only(bottom: 30), // Espacio inferior
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFC107), // Color amarillo
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Relleno interno
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // Bordes redondeados
                    ),
                    elevation: 5, // Sombra del botón
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Regresa a la pantalla anterior
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

// Widget personalizado que representa cada opción (imagen + texto)
class FoodOptionButton extends StatelessWidget {
  final String imagePath; // Ruta de la imagen a mostrar
  final String label;     // Texto que acompaña a la imagen

  const FoodOptionButton({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Detecta toques sobre la tarjeta (imagen + texto)
      onTap: () {
        // Incrementa el contador de comida
        CounterDecision.instance.incrementFoods();

        // Muestra un mensaje de confirmación al usuario
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Has seleccionado $label'),
            duration: Duration(milliseconds: 800), // Tiempo breve
          ),
        );

        // Regresa a la pantalla de decisión luego de un pequeño retraso
        Future.delayed(const Duration(milliseconds: 800), () {
          Navigator.pushNamed(context, '/decision');
        });
      },
      child: Column( // Columna con imagen + texto
        children: [
          Expanded( // Hace que la imagen ocupe el espacio disponible
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain, // Ajusta la imagen dentro del contenedor
            ),
          ),
          const SizedBox(height: 8), // Espacio entre imagen y texto
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
