import 'package:flutter/cupertino.dart';
import 'package:hive_todo/features/feature_main_screen/dependency_injection/locator.dart';
import 'package:hive_todo/features/feature_main_screen/domain/use_cases/todo_use_cases.dart';

import '../../domain/models/task.dart';

class TasksProvider extends ChangeNotifier {
  //  getting our use cases
  final TodoUseCases todoUseCases = locator.get<TodoUseCases>();

  List<Map>? _tasks = [];

  List<Task>? getTasks() {
    return _tasks?.map((task) => Task.fromMap(task)).toList();
  }

  //  checkbox was tapped
  void checkboxChanged(bool value, int index) {
    List<Task>? myTasks = _tasks?.map((task) => Task.fromMap(task)).toList();
    //  change the values in the list
    myTasks![index].taskCompleted = value;
    print("Check changed to ${value}");
    notifyListeners();
  }

  void addTask({required Task task}) {
    _tasks?.add(Task.toMap(task));
    notifyListeners();
  }

  void deleteTask({required int index}) {
    _tasks?.removeAt(index);
    notifyListeners();
  }

  Future<void> updateDatabase() async {
    await todoUseCases.updateDatabaseUseCase.invoke(tasks: _tasks);
  }

  Future<void> loadTasksEvent() async {
    var myTasks = await todoUseCases.loadTasksUseCase.invoke();
    _tasks = myTasks?.map((task) => Task.toMap(task)).toList();
  }
}














