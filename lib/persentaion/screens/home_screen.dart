// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:todoly/data/data.dart';
import 'package:todoly/persentaion/screens/allTask.dart';
import 'package:todoly/persentaion/screens/done_screen.dart';
import 'package:todoly/persentaion/screens/to_do_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _select = 0;
  static List<Widget> _pages = <Widget>[
    AllTasks(),
    ToDoScreen(),
    DoneScreen()
  ];
  @override
  void initState() {
    super.initState();
    for (var i in tasks) {
      ToDo.add(i);
    }
  }

  _onItemTapped(int index) {
    setState(() {
      _select = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.blueGrey,
              selectedItemColor: Colors.blue[900],
              unselectedFontSize: 15,
              selectedFontSize: 17,
              currentIndex: _select,
              onTap: _onItemTapped,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'AllTasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.camera),
                  label: 'ToDo',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Done',
                ),
              ],
            ),
            appBar: AppBar(
              title: Text("Organize your tasks"),
              // bottom: TabBar(
              //   tabs: [
              //     Tab(
              //       text: "All Tasks",
              //     ),
              //     Tab(
              //       text: "To DO",
              //     ),
              //     Tab(
              //       text: "Done",
              //     ),
              //   ],
              // ),
            ),
            body: Center(
              child: _pages.elementAt(_select),
            )
            //start body tab bar
            // body: TabBarView(
            //   children: [
            //     AllTasks(),
            //     ToDoScreen(tasks: ToDo),
            //     DoneScreen(tasks: Done),
            //   ],
            // ),
            //end body tab bar

            ));
  }
}
