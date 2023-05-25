import 'package:hive_todo/features/feature_main_screen/domain/repository/todo_repository.dart';

import '../models/task.dart';

class UpdateDatabaseUseCase {

  final TodoRepository repository;

  UpdateDatabaseUseCase({required this.repository});

  Future<void> invoke({required Task task}) async {
    await repository.updateDatabase(task: task);
  }
}