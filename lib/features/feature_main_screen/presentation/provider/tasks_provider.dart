import 'package:flutter/cupertino.dart';

import '../../domain/models/task.dart';

class TasksProvider extends ChangeNotifier {

  final List<Task> _tasks = [
    Task(
        taskName: "Eat Breakfast",
        taskCompleted: false,),
    Task(
        taskName: "Do something fun",
        taskCompleted: true,),
    Task(
        taskName: "Share memes",
        taskCompleted: false,),
    Task(
        taskName: "Eat, Sleep and play",
        taskCompleted: true,),
  ];

  List<Task> get getTasks => _tasks;

  //  checkbox was tapped
  void checkboxChanged(bool value, int index) {
    //  change the values in the list
    _tasks[index].taskCompleted = value;
    notifyListeners();
  }
}
