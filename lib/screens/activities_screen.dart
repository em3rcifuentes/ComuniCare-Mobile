import 'package:flutter/material.dart';
import '../counter_decision.dart'; 

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

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
                'VAMOS A DIVERTIRNOS',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF9A825), 
                ),
              ),

              const SizedBox(height: 30), 

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    crossAxisCount: 2, 
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

              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFC107), 
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityButton extends StatelessWidget {
  final String imagePath; 
  final String label;     

  const ActivityButton({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CounterDecision.instance.incrementActivities();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Seleccionaste $label')),
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
