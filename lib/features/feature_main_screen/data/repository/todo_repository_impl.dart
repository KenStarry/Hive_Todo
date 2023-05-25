import 'package:hive/hive.dart';
import 'package:hive_todo/features/feature_main_screen/data/utils/constants.dart';
import 'package:hive_todo/features/feature_main_screen/domain/models/task.dart';
import 'package:hive_todo/features/feature_main_screen/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {

  //  initializing the Hive database
  final todoBox = Hive.box(Constants.todoBoxDb);

  @override
  Future<void> createInitialData() async {
    // TODO: implement createInitialData
    throw UnimplementedError();
  }

  @override
  Future<void> createTask({required Task task}) async {
    await todoBox.put(Constants.todoListKey, task);
  }

  @override
  Future<List<Task>> loadTasks() async {
    return await todoBox.get(Constants.todoListKey);
  }

  @override
  Future<void> updateDatabase({required Task task}) async {
    await todoBox.put(Constants.todoListKey, task);
  }
}





































