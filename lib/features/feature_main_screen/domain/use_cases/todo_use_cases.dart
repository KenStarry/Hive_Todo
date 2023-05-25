import 'package:hive_todo/features/feature_main_screen/domain/use_cases/load_tasks_use_case.dart';
import 'package:hive_todo/features/feature_main_screen/domain/use_cases/update_database_use_case.dart';

class TodoUseCases {
  final LoadTasksUseCase loadTasksUseCase;
  final UpdateDatabaseUseCase updateDatabaseUseCase;

  TodoUseCases(
      {required this.loadTasksUseCase, required this.updateDatabaseUseCase});
}
