// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unused_element

import 'package:flutter/material.dart';
import 'package:todoly/data/data.dart';
import 'package:todoly/data/models/task.dart';
import 'package:todoly/persentaion/screens/allTask.dart';

class AddTaskScreen extends StatelessWidget {
  static const String routeName = "/addTask";
   TextEditingController taskNameController = TextEditingController();

  AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Task'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  // keyboardType: TextInputType.phone,
                  controller: taskNameController,

                  decoration: InputDecoration(
                      hintText: "Enter Task Name",
                      label: Text('Task Name'),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 2),
                      )),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (taskNameController.text != '') {
                      tasks.add(Task(taskName: taskNameController.text));
                      
                      Navigator.of(context).pop(taskNameController.text);
                    }
                  },
                  child: Text('Add Task')),
            ],
          ),
        ));
  }
}
