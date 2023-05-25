class Task {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  Task(
      {required this.taskName,
      required this.taskCompleted,
      required this.onChanged});
}
