class Todo {
  String? title;
  bool? complete;

  Todo({
    this.title,
    this.complete,
  });

  Todo.fromMap(Map map)
      : title = map["title"],
        complete = map["complete"];

  Map toMap() {
    return {
      "title":title,
      "complete":complete
    };
  }
}
