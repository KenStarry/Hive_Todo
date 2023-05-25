import 'package:flutter/material.dart';

import '../../domain/models/task.dart';

class TodoCard extends StatelessWidget {

  final Task task;

  const TodoCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.deepOrange.shade400,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          //  checkbox
          Checkbox(value: task.taskCompleted, onChanged: task.onChanged),
          //  task name
          Text(task.taskName),
        ],
      ),
    );
  }
}
