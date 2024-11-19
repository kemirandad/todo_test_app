class Task {
  String title;
  final String body;
  bool isDone;

  Task({
    required this.title,
    required this.body,
    this.isDone = false,
  });
}
