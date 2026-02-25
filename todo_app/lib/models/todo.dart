class Todo { // Todo class is used as the cookie cutter of todo cookies
  String id;
  String title;
  bool isCompleted;

  Todo({
    required this.title,
    required this.id,
    this.isCompleted = false
  });
}