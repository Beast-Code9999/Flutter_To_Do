class Todo {
  String id;
  String title;
  bool isCompleted;

  Todo({
    required this.title,
    required this.id,
    this.isCompleted = false
  });
}