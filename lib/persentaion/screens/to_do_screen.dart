// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoly/data/data.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              ToDo[index].taskName,
            ),
            subtitle:
                Text(DateFormat('dd/MM').add_jm().format(ToDo[index].dueDate)),
          );
        },
        itemCount: ToDo.length,
      ),
    );
  }
}
