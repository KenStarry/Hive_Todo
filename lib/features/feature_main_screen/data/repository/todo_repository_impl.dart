import 'package:hive/hive.dart';
import 'package:hive_todo/features/feature_main_screen/data/utils/constants.dart';
import 'package:hive_todo/features/feature_main_screen/dependency_injection/locator.dart';
import 'package:hive_todo/features/feature_main_screen/domain/models/task.dart';
import 'package:hive_todo/features/feature_main_screen/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  //  initializing the Hive database
  final todoBox = locator.get<Box>();

  @override
  Future<List<Task>?> loadTasks() async {
    List? hiveList = await todoBox.get(Constants.todoListKey);
    return hiveList?.map((task) => Task.fromMap(task)).toList();
  }

  @override
  Future<void> updateDatabase({required List<Map>? tasks}) async {
    await todoBox.put(Constants.todoListKey, tasks);
  }
}
