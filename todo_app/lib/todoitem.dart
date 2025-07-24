import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.title});
  final String title;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15.0),
      ),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsetsGeometry.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.notes_outlined, size: 40.0),
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(() {
                  isChecked = val!;
                }),
              },
            ),
          ],
        ),
      ),
    );
  }
}
