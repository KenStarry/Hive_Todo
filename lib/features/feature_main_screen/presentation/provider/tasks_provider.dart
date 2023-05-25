import 'package:flutter/cupertino.dart';
import 'package:hive_todo/features/feature_main_screen/data/repository/todo_repository_impl.dart';
import 'package:hive_todo/features/feature_main_screen/domain/use_cases/create_task_use_case.dart';
import 'package:hive_todo/features/feature_main_screen/domain/use_cases/load_tasks_use_case.dart';
import 'package:hive_todo/features/feature_main_screen/domain/use_cases/todo_use_cases.dart';
import 'package:hive_todo/features/feature_main_screen/domain/use_cases/update_database_use_case.dart';

import '../../domain/models/task.dart';

class TasksProvider extends ChangeNotifier {
  //  getting our use cases
  final TodoUseCases todoUseCases = TodoUseCases(
      createTaskUseCase: CreateTaskUseCase(repository: TodoRepositoryImpl()),
      loadTasksUseCase: LoadTasksUseCase(repository: TodoRepositoryImpl()),
      updateDatabaseUseCase:
      UpdateDatabaseUseCase(repository: TodoRepositoryImpl()));

  List<Map>? _tasks = [];

  List<Task>? getTasks() {
    return _tasks?.map((task) => Task.fromMap(task)).toList();
  }

  //  checkbox was tapped
  void checkboxChanged(bool value, int index) {
    List<Task>? myTasks = _tasks?.map((task) => Task.fromMap(task)).toList();
    //  change the values in the list
    myTasks![index].taskCompleted = value;
    notifyListeners();
  }

  void addTask({required Task task}) {
    _tasks?.add(Task.toMap(task));
    notifyListeners();
  }

  // Future<void> createTaskEvent({required Task task}) async {
  //   await todoUseCases.createTaskUseCase.invoke(task: task);
  // }

  Future<void> updateDatabase() async {
    await todoUseCases.updateDatabaseUseCase.invoke(tasks: _tasks);
  }

  Future<void> loadTasksEvent() async {
    var myTasks = await todoUseCases.loadTasksUseCase.invoke();
    _tasks = myTasks?.map((task) => Task.toMap(task)).toList();
  }
}














