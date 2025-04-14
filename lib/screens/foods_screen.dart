import 'package:flutter/material.dart';
import '../counter_decision.dart'; 

class FoodsScreen extends StatelessWidget {
  const FoodsScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Evita superponer contenido sobre áreas del sistema
      child: Scaffold( 
        body: Container(
          // Fondo con degradado vertical 
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFADE8F4), Color(0xFFCAF7A1)],
            ),
          ),
          child: Column( 
            children: [
              const SizedBox(height: 30), // Espacio superior

              // Título principal de la pantalla
              const Text(
                '¿VAMOS A COMER?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF9A825), 
                ),
              ),

              const SizedBox(height: 30), // Espacio entre título y botones

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

              // Botón de navegación para volver
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
                    Navigator.pushNamedAndRemoveUntil(context, '/decision', (route) => false);
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

class FoodOptionButton extends StatelessWidget {
  final String imagePath; 
  final String label;     

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
            duration: Duration(milliseconds: 800),
          ),
        );

        Future.delayed(const Duration(milliseconds: 800), () {
          Navigator.pushNamed(context, '/decision');
        });
      },
      child: Column( 
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
