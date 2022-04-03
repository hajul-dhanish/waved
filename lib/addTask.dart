import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

TextEditingController _taskTextField = TextEditingController();

Widget AddTask(BuildContext context) {
  return AlertDialog(
    title: const Text('Add New Task'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: "Add Task"),
        ),
        const SizedBox(height: 8),
        // -------------------------------------------------
        TextButton(
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime.now(),
                  maxTime: DateTime(2023, 9, 1),
                  onChanged: (date) {},
                  onConfirm: (date) {},
                  currentTime: DateTime.now(),
                  locale: LocaleType.en);
            },
            child: const Center(
              child: Text(
                'Add Dead line',
                style: TextStyle(color: Colors.blue),
              ),
            )),
        // -------------------------------------------------
      ],
    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
      const SizedBox(width: 4),
      ElevatedButton(
        onPressed: () {},
        child: const Text('Add'),
      ),
    ],
  );
}
