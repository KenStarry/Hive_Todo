import 'package:hive_todo/features/feature_main_screen/domain/repository/todo_repository.dart';

import '../models/task.dart';

class LoadTasksUseCase {

  final TodoRepository repository;

  LoadTasksUseCase({required this.repository});

  Future<List<Task>> invoke() async {
    return await repository.loadTasks();
  }
}