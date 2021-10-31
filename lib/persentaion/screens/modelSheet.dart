// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable, avoid_print

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:todoly/data/data.dart';
import 'package:todoly/data/models/task.dart';

class ModelSheet extends StatefulWidget {
  const ModelSheet({Key? key}) : super(key: key);

  @override
  State<ModelSheet> createState() => _ModelSheetState();
}

class _ModelSheetState extends State<ModelSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          width: 2),
                                    )),
                              ),
                              DateTimeFormField(
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.black45),
                                  errorStyle:
                                      TextStyle(color: Colors.redAccent),
                                  border: OutlineInputBorder(),
                                  suffixIcon: Icon(Icons.event_note),
                                  labelText: 'Only date',
                                ),
                                mode: DateTimeFieldPickerMode.date,
                                autovalidateMode: AutovalidateMode.always,
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
                                  tasks.add(
                                      Task(taskName: taskNameController.text,dueDate: DateTime.utc(2022, 1, 9)));
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
        ));
  }
}
