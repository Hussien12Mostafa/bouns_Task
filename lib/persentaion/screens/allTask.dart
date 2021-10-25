
// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoly/data/data.dart';
class AllTasks extends StatefulWidget {
  const AllTasks({ Key? key }) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          tasks[index].taskName,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    decoration: tasks[index].isDone
                                        ? TextDecoration.lineThrough
                                        : null,
                                  ),
                        ),
                        trailing: Checkbox(
                          onChanged: (val) {
                            setState(() {
                              tasks[index].isDone = val!;
                              if (tasks[index].isDone) {
                                Done.add(tasks[index]);
                                ToDo.remove(tasks[index]);
                              } else {
                                ToDo.add(tasks[index]);
                                Done.remove(tasks[index]);
                              }
                            });
                          },
                          value: tasks[index].isDone,
                        ),
                      );
                    },
                    itemCount: tasks.length,
                  )
    );
  }
}