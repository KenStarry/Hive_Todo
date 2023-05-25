import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_todo/features/feature_main_screen/data/repository/todo_repository_impl.dart';
import 'package:hive_todo/features/feature_main_screen/domain/use_cases/create_task_use_case.dart';
import 'package:hive_todo/features/feature_main_screen/domain/use_cases/load_tasks_use_case.dart';
import 'package:hive_todo/features/feature_main_screen/domain/use_cases/todo_use_cases.dart';
import 'package:hive_todo/features/feature_main_screen/domain/use_cases/update_database_use_case.dart';

import '../data/utils/constants.dart';

final locator = GetIt.instance;

void init() {

  //  registering hive
  locator.registerLazySingleton<Box>(() => Hive.box(Constants.todoBoxDb));

  //  will be removed whenever it's not necessary anymore
  locator.registerLazySingleton<TodoRepositoryImpl>(() => TodoRepositoryImpl());

  //  providing our use cases
  locator.registerLazySingleton<TodoUseCases>(() => TodoUseCases(
      createTaskUseCase:
          CreateTaskUseCase(repository: locator.get<TodoRepositoryImpl>()),
      loadTasksUseCase:
          LoadTasksUseCase(repository: locator.get<TodoRepositoryImpl>()),
      updateDatabaseUseCase: UpdateDatabaseUseCase(
          repository: locator.get<TodoRepositoryImpl>())));
}
