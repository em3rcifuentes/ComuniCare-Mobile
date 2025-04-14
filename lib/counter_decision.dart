class CounterDecision {
  static final CounterDecision instance = CounterDecision._internal();

  int _foods = 0;
  int _activities = 0;
  int _emotions = 0;
  int _bathroom = 0;

  CounterDecision._internal();

  void incrementFoods() => _foods++;
  void incrementActivities() => _activities++;
  void incrementEmotions() => _emotions++;
  void incrementBathroom() => _bathroom++;

  int get foodCount => _foods;
  int get activityCount => _activities;
  int get emotionCount => _emotions;
  int get bathroomCount => _bathroom;

  void reset() {
    _foods = 0;
    _activities = 0;
    _emotions = 0;
    _bathroom = 0;
  }
}
