import 'package:hive_todo/features/feature_main_screen/domain/models/task.dart';

abstract class TodoRepository {
  //  creating a taks
  Future<void> createTask({required Task task});

  //  load all tasks
  Future<List<Task>?> loadTasks();

  //  update database
  Future<void> updateDatabase({required List<Map>? tasks});
}
