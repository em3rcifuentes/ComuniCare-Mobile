import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; 
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/decision_screen.dart';
import 'screens/foods_screen.dart';
import 'screens/activities_screen.dart';
import 'screens/emotion_screen.dart';
import 'screens/bathroom_screen.dart';
import 'screens/progress_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ComuniCareApp()); 
}

class ComuniCareApp extends StatelessWidget {
  const ComuniCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ComuniCare',

      initialRoute: '/',

      routes: {
        '/': (context) => const WelcomeScreen(),          // Pantalla de bienvenida
        '/login': (context) => const LoginScreen(),       // Pantalla de inicio de sesión
        '/register': (context) => const RegisterScreen(), // Pantalla de registro
        '/decision': (context) => const DecisionScreen(), // Menú principal
        '/foods': (context) => const FoodsScreen(),       // Módulo: Comidas
        '/activities': (context) => const ActivitiesScreen(), // Módulo: Actividades
        '/emotion': (context) => const EmotionScreen(),   // Módulo: Emociones
        '/bathroom': (context) => const BathroomScreen(), // Módulo: Baño
        '/progress': (context) => const ProgressScreen(), // Pantalla de progreso
      },
    );
  }
}
