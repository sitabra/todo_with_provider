import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_practice/widgets/todo_widget.dart';

import '../provider/todos.dart';
class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosComplete;

    return todos.isEmpty
        ? Center(
      child: Text(
        'No Completed tasks',
        style: TextStyle(fontSize: 20),
      ),
    )
        : ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];

          return TodoWidget(todo: todo);
        },
        separatorBuilder: (context, index){
          return Container(height: 8);
        }
    );
  }
}

