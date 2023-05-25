import 'package:flutter/material.dart';

import '../../domain/models/task.dart';

class TodoCard extends StatelessWidget {
  final Task task;
  Function(bool?)? onChanged;

  TodoCard({Key? key, required this.task, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.deepOrange.shade300,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          //  checkbox
          Checkbox(
            value: task.taskCompleted,
            onChanged: onChanged,
            activeColor: Colors.deepOrange.shade700,
          ),
          //  task name
          Text(task.taskName,
          style: TextStyle(
            fontSize: 16,
            decoration: task.taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
          ),),
        ],
      ),
    );
  }
}
