class Task {
  String title;
  bool isComplete;

  Task({required this.title, required this.isComplete});

  void toggleComplete() {
    isComplete = !isComplete;
  }
}
