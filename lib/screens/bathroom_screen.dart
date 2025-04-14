import 'package:flutter/material.dart';
import '../counter_decision.dart'; 

class BathroomScreen extends StatelessWidget {
  const BathroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFADE8F4), Color(0xFFCAF7A1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 30), 
              const Text(
                '¿VAMOS AL BAÑO?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF9A825), // Naranja
                ),
              ),

              const SizedBox(height: 30), 

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
                    Navigator.pushNamedAndRemoveUntil(context, '/decision', (route) => false); 
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

class BathroomOption extends StatelessWidget {
  final String imagePath; 
  final String label;     

  const BathroomOption({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CounterDecision.instance.incrementBathroom();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Seleccionaste: $label')),
        );

        Future.delayed(const Duration(milliseconds: 800), () {
          Navigator.pushNamed(context, '/decision');
        });
      },
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imagePath, 
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
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
