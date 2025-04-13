// Archivo: lib/counter_decision.dart

class CounterDecision {
  // Singleton para acceder desde cualquier parte de la app
  static final CounterDecision instance = CounterDecision._internal();

  // Variables para llevar el conteo de uso por módulo
  int _foods = 0;
  int _activities = 0;
  int _emotions = 0;
  int _bathroom = 0;

  // Constructor privado
  CounterDecision._internal();

  // Métodos para incrementar cada contador
  void incrementFoods() => _foods++;
  void incrementActivities() => _activities++;
  void incrementEmotions() => _emotions++;
  void incrementBathroom() => _bathroom++;

  // Getters para acceder a los contadores
  int get foodCount => _foods;
  int get activityCount => _activities;
  int get emotionCount => _emotions;
  int get bathroomCount => _bathroom;

  // Método para reiniciar todos los contadores
  void reset() {
    _foods = 0;
    _activities = 0;
    _emotions = 0;
    _bathroom = 0;
  }
}
