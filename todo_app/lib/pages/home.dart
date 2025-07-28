import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constans/button_text.dart';
import 'package:todo_app/constans/color.dart';
import 'package:todo_app/constans/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/pages/add_new_task.dart';
import 'package:todo_app/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;

  List<Task> todo = [
    Task(
      type: TaskType.note,
      title: "Go to Work",
      description: "Routine Mission",
      isCompleted: false,
    ),
    Task(
      type: TaskType.calender,
      title: "Study on Flutter",
      description: "Don't Forget",
      isCompleted: false,
    ),
    Task(
      type: TaskType.contest,
      title: "Share Instagram Posts",
      description: "Pass the Others",
      isCompleted: false,
    ),
  ];

  List<Task> completed = [
    Task(
      type: TaskType.note,
      title: "Social Media Shares",
      description: "Routine Mission",
      isCompleted: false,
    ),
    Task(
      type: TaskType.calender,
      title: "Meeting",
      description: "Don't Forget",
      isCompleted: false,
    ),
    Task(
      type: TaskType.contest,
      title: "Make Designs",
      description: "Pass the Others",
      isCompleted: false,
    ),
  ];

  void addNewText(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    DateTime date = DateTime.now();

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              // Header
              Container(
                width: deviceWidth,
                height: deviceHeight / 5,
                color: Colors.purple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.0),
                    Text(
                      '$date',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      "My Todo List",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Top Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true, // takes space as it contains
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return TodoItem(task: todo[index]);
                      },
                    ),
                  ),
                ),
              ),
              // Completed Text
              SizedBox(
                width: deviceWidth,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "COMPLETED",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              // Bottom Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false, // generally in ListView
                      shrinkWrap: true, // generally in ListView
                      itemCount: completed.length,
                      itemBuilder: (context, index) {
                        return TodoItem(task: completed[index]);
                      },
                    ),
                  ),
                ),
              ),
              // Add New Task Button Bottom
              Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: SizedBox(
                  height: 36.0,
                  width: 170.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddNewTaskPage(
                            addNewTask: (newTask) => addNewText(newTask),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const CustomButtonText("Add New Task"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
