// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoly/data/data.dart';
import 'package:todoly/data/models/task.dart';
import 'package:date_field/date_field.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
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
                        context: context,
                        builder: (BuildContext context) {
                          TextEditingController taskNameController =
                              TextEditingController();
                          TextEditingController taskDateController =
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
                                        DateTimeFormField(
                                          decoration: const InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Colors.black45),
                                            errorStyle: TextStyle(
                                                color: Colors.redAccent),
                                            border: OutlineInputBorder(),
                                            suffixIcon: Icon(Icons.event_note),
                                            labelText: 'Only date',
                                          ),
                                          mode: DateTimeFieldPickerMode.date,
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          validator: (e) => (e?.day ?? 0) == 1
                                              ? 'Please not the first day'
                                              : null,
                                          onDateSelected: (DateTime value) {
                                            print(value);
                                          },
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (taskNameController.text != '') {
                                            tasks.add(Task(
                                                taskName:
                                                    taskNameController.text));
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
