import 'package:hive_todo/features/feature_main_screen/domain/models/task.dart';

abstract class TodoRepository {
  //  run this method if its first time a user is logging in
  Future<void> createInitialData();

  //  creating a taks
  Future<void> createTask({required Task task});

  //  load all tasks
  Future<List<Task>> loadTasks();

  //  update database
  Future<void> updateDatabase({required Task task});
}
