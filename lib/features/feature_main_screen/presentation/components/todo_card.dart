import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../domain/models/task.dart';

class TodoCard extends StatelessWidget {
  final Task task;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;

  TodoCard({Key? key, required this.task, required this.onChanged, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(onPressed: onDelete,
          icon: Icons.delete,
          label: "Delete",
          backgroundColor: Colors.red.shade600,
          borderRadius: BorderRadius.circular(16),),
        ],
      ),
      child: Container(
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
      ),
    );
  }
}
