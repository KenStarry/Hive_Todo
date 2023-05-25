import 'package:flutter/material.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/main_screen.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/provider/tasks_provider.dart';
import 'package:provider/provider.dart';

void main() {
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
