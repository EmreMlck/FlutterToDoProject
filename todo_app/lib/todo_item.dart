import 'package:flutter/material.dart';
import 'package:todo_app/constans/tasktype.dart';
import 'package:todo_app/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isCompleted ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15.0),
      ),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsetsGeometry.all(20.0),
        child: Row(
          children: [
            widget.task.type == TaskType.note
                ? Image.asset('assets/images/category.png')
                : widget.task.type == TaskType.calender
                ? Image.asset('assets/images/categorysec.png')
                : Image.asset('assets/images/categorythird.png'),

            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.00,
                      decoration: widget.task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  Text(
                    widget.task.description,
                    style: TextStyle(
                      fontSize: 12.0,
                      decoration: widget.task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(() {
                  widget.task.isCompleted = !widget.task.isCompleted;
                  isChecked = val!; // = val %100 NOT NULL !
                }),
              },
            ),
          ],
        ),
      ),
    );
  }
}
