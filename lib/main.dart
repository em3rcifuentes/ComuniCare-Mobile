// Importa el paquete de Flutter con los widgets de Material Design
import 'package:flutter/material.dart';

// Importa todas las pantallas (screens) de la app desde su carpeta
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/decision_screen.dart';
import 'screens/foods_screen.dart';
import 'screens/activities_screen.dart';
import 'screens/emotion_screen.dart';
import 'screens/bathroom_screen.dart';
import 'screens/progress_screen.dart';

// Función principal que ejecuta la aplicación
void main() {
  runApp(const ComuniCareApp()); // Inicia la app con el widget principal
}

// Widget principal de la aplicación
class ComuniCareApp extends StatelessWidget {
  const ComuniCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Elimina el banner de "debug" en la esquina superior derecha
      debugShowCheckedModeBanner: false,

      // Título de la aplicación (no visible directamente en la interfaz)
      title: 'ComuniCare',

      // Define la primera pantalla que se muestra al iniciar la app
      initialRoute: '/',

      // Lista de rutas disponibles en la aplicación
      routes: {
        '/': (context) => const WelcomeScreen(),        // Pantalla de bienvenida
        '/login': (context) => const LoginScreen(),     // Pantalla de inicio de sesión
        '/register': (context) => const RegisterScreen(), // Pantalla de registro
        '/decision': (context) => const DecisionScreen(), // Menú principal
        '/foods': (context) => const FoodsScreen(),       // Módulo: Comidas
        '/activities': (context) => const ActivitiesScreen(), // Módulo: Actividades
        '/emotion': (context) => const EmotionScreen(),     // Módulo: Emociones
        '/bathroom': (context) => const BathroomScreen(),   // Módulo: Baño
        '/progress': (context) => const ProgressScreen(),   // Pantalla de progreso
      },
    );
  }
}
