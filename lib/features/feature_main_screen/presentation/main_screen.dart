import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_todo/features/feature_main_screen/domain/models/task.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/components/main_appbar.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/components/todo_card.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/provider/tasks_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {

    final List<Task> tasks = Provider.of<TasksProvider>(context).getTasks;
    
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.deepOrange.shade100,
          systemNavigationBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: Colors.deepOrange.shade100,
        appBar: mainAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: tasks.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return TodoCard(
                task: tasks[index],
                onChanged: (value) => Provider.of<TasksProvider>(context, listen: false).checkboxChanged(value!, index),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
