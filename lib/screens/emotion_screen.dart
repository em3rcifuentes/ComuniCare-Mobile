import 'package:flutter/material.dart';
import '../counter_decision.dart'; 

class EmotionScreen extends StatelessWidget {
  const EmotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFADE8F4), Color(0xFFCAF7A1)],
            ),
          ),
          child: Column( 
            children: [
              const SizedBox(height: 30), 
              const Text(
                '¿COMO TE SIENTES?',
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

class EmotionButton extends StatelessWidget {
  final String imagePath; 
  final String label;    

  const EmotionButton({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CounterDecision.instance.incrementEmotions();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Te sientes $label')),
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
