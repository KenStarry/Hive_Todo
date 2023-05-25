import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_todo/features/feature_main_screen/domain/models/task.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/components/main_appbar.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/components/todo_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final List<Task> _tasks;

  @override
  void initState() {
    super.initState();

    _tasks = [
      Task(
          taskName: "Eat Breakfast",
          taskCompleted: false,
          onChanged: (value) => checkboxChanged(value, 0)),
      Task(
          taskName: "Do something fun",
          taskCompleted: true,
          onChanged: (value) => checkboxChanged(value, 1)),
      Task(
          taskName: "Share memes",
          taskCompleted: false,
          onChanged: (value) => checkboxChanged(value, 2)),
      Task(
          taskName: "Eat, Sleep and play",
          taskCompleted: true,
          onChanged: (value) => checkboxChanged(value, 3)),
    ];
  }

  //  checkbox was tapped
  void checkboxChanged(bool? value, int index) {
    //  change the values in the list
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
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
            itemCount: _tasks.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return TodoCard(
                task: _tasks[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
