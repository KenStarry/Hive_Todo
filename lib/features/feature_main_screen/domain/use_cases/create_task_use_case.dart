import 'package:hive_todo/features/feature_main_screen/domain/repository/todo_repository.dart';

import '../models/task.dart';

class CreateTaskUseCase {
  final TodoRepository repository;

  CreateTaskUseCase({required this.repository});

  Future<void> invoke({required Task task}) async {
    repository.createTask(task: task);
  }
}
