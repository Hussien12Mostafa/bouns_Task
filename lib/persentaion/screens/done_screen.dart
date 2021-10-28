// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:todoly/data/data.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              Done[index].taskName,
            ),
            trailing: Text(
                DateFormat('dd/MM').add_jm().format(Done[index].doneTask!)),
          );
        },
        itemCount: Done.length,
      ),

      /* ListView(
              children: tasks
                  .map(
                    (e) => ListTile(
                      title: Text(e.taskName),
                      trailing: Checkbox(
                        onChanged: (val) {
                          setState(() {
                            e.isDone = val!;
                          });
                        },
                        value: e.isDone,
                      ),
                    ),
                  )
                  .toList(),
            ), */
    );
  }
}
