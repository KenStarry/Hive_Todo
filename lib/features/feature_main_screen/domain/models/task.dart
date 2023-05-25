class Task {
  String taskName;
  bool taskCompleted;

  Task({required this.taskName, required this.taskCompleted});

  static Task fromMap(Map map) =>
      Task(taskName: map["taskName"], taskCompleted: map["taskCompleted"]);

  static Map toMap(Task task) =>
      {"taskName": task.taskName, "taskCompleted": task.taskCompleted};
}
