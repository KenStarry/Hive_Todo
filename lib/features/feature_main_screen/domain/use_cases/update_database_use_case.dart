import 'package:hive_todo/features/feature_main_screen/domain/repository/todo_repository.dart';

import '../models/task.dart';

class UpdateDatabaseUseCase {

  //^! Data from our repo
  final TodoRepository repository;

  UpdateDatabaseUseCase({required this.repository});

  Future<void> invoke({required List<Map>? tasks}) async {
    await repository.updateDatabase(tasks: tasks);
  }
}