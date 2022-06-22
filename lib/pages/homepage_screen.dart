import 'package:flutter/material.dart';
import 'package:to_do_app_practice/widgets/completed_list.dart';
import 'package:to_do_app_practice/widgets/todo_list.dart';

import '../widgets/add_todo_dialogue.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      backgroundColor: Colors.amber.shade100,
     appBar: AppBar(
       backgroundColor: Colors.orangeAccent.shade200,
       title: Text("To-Do App"),
    ),
    bottomNavigationBar:BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              backgroundColor: Colors.orangeAccent.shade200,
              selectedItemColor: Colors.white,
              onTap: (index) {
                setState(() {
                 selectedIndex= index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.done),
                    label: 'Completed'),
              ]),
        ),
      ),
    ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.orangeAccent.shade200,
        onPressed: () => showDialog(
            context: context,
            builder: (context) => const AddTodoDialogWidget(),
        barrierDismissible: false),
        child: const Icon(Icons.add_circle_outline_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
