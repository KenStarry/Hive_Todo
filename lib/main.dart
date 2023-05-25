import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_todo/features/feature_main_screen/data/utils/constants.dart';
import 'package:hive_todo/features/feature_main_screen/dependency_injection/locator.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/main_screen.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/provider/tasks_provider.dart';
import 'package:provider/provider.dart';

void main() async {

  init();
  //  initialize hive
  await Hive.initFlutter();
  var todoBox = await Hive.openBox(Constants.todoBoxDb);

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => TasksProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
    );
  }
}
