import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_todo/features/feature_main_screen/data/utils/constants.dart';
import 'package:hive_todo/features/feature_main_screen/domain/models/task.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/components/dialog_box.dart';
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
  //  my controller
  final _controller = TextEditingController();

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: () {
                //  create a new task in Hive
                Provider.of<TasksProvider>(context, listen: false).addTask(
                    task: Task(
                        taskName: _controller.value.text,
                        taskCompleted: false));
                Provider.of<TasksProvider>(context, listen: false)
                    .updateDatabase();
                Navigator.of(context).pop();
              },
              onCancel: () => Navigator.of(context).pop());
        });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<TasksProvider>(context).loadTasksEvent();
    final List<Task>? tasks = Provider.of<TasksProvider>(context).getTasks();

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.deepOrange.shade100,
          systemNavigationBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: Colors.deepOrange.shade100,
        appBar: mainAppBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange.shade300,
          onPressed: createNewTask,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: tasks == null || tasks.isEmpty
              ? const Center(
                child: Text(
                    "No Tasks found",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
              )
              : ListView.separated(
                  itemCount: tasks.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TodoCard(
                      task: tasks[index],
                      onChanged: (value) {
                        Provider.of<TasksProvider>(context, listen: false)
                            .checkboxChanged(value!, index);
                        Provider.of<TasksProvider>(context, listen: false)
                            .updateDatabase();
                      },
                      onDelete: (context) {
                        Provider.of<TasksProvider>(context, listen: false)
                            .deleteTask(index: index);
                        Provider.of<TasksProvider>(context, listen: false)
                            .updateDatabase();
                      },
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
