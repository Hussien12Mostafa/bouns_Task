// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:todoly/data/data.dart';
import 'package:todoly/data/models/task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Wrap(
            //will break to another line on overflow
            direction: Axis.horizontal, //use vertical to show  on vertical axis
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10),
                  child: FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: () async {
                      // await Navigator.of(context)
                      //     .pushNamed(AddTaskScreen.routeName);
                      // setState(() {});
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          TextEditingController taskNameController =
                              TextEditingController();
                          return Scaffold(
                              appBar: AppBar(
                                title: Text('Add Task'),
                              ),
                              body: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        TextField(
                                          // keyboardType: TextInputType.phone,
                                          controller: taskNameController,
                                          toolbarOptions: ToolbarOptions(copy: true,paste: true,cut:true,selectAll: true),
                                         
                                          decoration: InputDecoration(
                                              hintText: "Enter Task Name",
                                              label: Text('Task Name'),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    width: 2),
                                              )),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              _selectDate(context);
                                            },
                                            child: Text('Pick Date'))
                                      ],
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (taskNameController.text != '') {
                                            tasks.add(Task(
                                                taskName:
                                                    taskNameController.text,
                                                dueDate: selectedDate));
                                            ToDo.add(tasks[tasks.length - 1]);
                                            setState(() {});
                                            Navigator.of(context)
                                                .pop(taskNameController.text);
                                          }
                                        },
                                        child: Text('Add Task')),
                                  ],
                                ),
                              ));
                        },
                      );
                    },
                    child: Icon(Icons.add),
                  )),
            ]),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                tasks[index].taskName,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
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
                      tasks[index].doneTask = DateTime.now();
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
        ));
  }
}
