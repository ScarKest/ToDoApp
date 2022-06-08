class Task {
  String title;
  bool complete;

  Task({
    required this.title,
    required this.complete,
  });

  Task.fromMap(Map map)
      : title = map["title"],
        complete = map["complete"];

  Map toMap() {
    return {
      "title":title,
      "complete":complete
    };
  }
}
