import 'package:hive_todo/features/feature_main_screen/domain/models/task.dart';

abstract class TodoRepository {
  //  load all tasks
  Future<List<Task>?> loadTasks();

  //  update database
  Future<void> updateDatabase({required List<Map>? tasks});
}
