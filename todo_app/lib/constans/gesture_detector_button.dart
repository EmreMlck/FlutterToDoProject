import 'package:flutter/material.dart';
import 'package:todo_app/constans/tasktype.dart';

class CustomGestureButton extends StatefulWidget {
  final String imagePath;
  final TaskType taskType;

  final void Function(TaskType)? onSelected;
  const CustomGestureButton(
    this.imagePath,
    this.taskType, {
    this.onSelected,
    super.key,
  });

  @override
  State<CustomGestureButton> createState() => _CustomGestureButtonState();
}

class _CustomGestureButtonState extends State<CustomGestureButton> {
  TaskType taskType = TaskType.note; // default value of taskType

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onSelected != null) {
          widget.onSelected!(widget.taskType);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Category Selected: ${widget.taskType.name}"),
            duration: const Duration(milliseconds: 500),
          ),
        );
        setState(() {
          taskType = widget.taskType; // equalize the value come from the widget
        });
        // debugPrint(taskType.name); // check the debug console
      },
      child: Image.asset(widget.imagePath),
    );
  }
}
