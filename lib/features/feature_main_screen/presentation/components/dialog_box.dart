import 'package:flutter/material.dart';
import 'package:hive_todo/features/feature_main_screen/presentation/components/dialog_buttons.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({Key? key, required this.controller, required this.onSave, required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepOrange.shade100,
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //  text input field
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                label: Text("Add a new task"),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(),
                hintText: "Go shopping, call mom..."
              ),
            ),

            //  save and cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogButtons(text: "Cancel", onPressed: onCancel),
                const SizedBox(width: 16,),
                DialogButtons(text: "Save", onPressed: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}
