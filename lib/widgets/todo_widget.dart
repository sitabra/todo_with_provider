import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_practice/provider/todos.dart';


import '../model/todo.dart';
import '../pages/edit_todo_page.dart';
import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo? todo;

   TodoWidget({
    required this.todo,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
                backgroundColor: Colors.green,
                icon: Icons.edit,
                label: 'Edit',
                onPressed: (_) {
                  return editTodo(context, todo!);
                }
            ),
          ],),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
                backgroundColor: Colors.red,
                icon: Icons.delete,
                label: 'Delete',
                onPressed: (_) {
                  return deleteTodo(context, todo!);
                }
            ),
          ],),
        child: buildTodo(context),
      ),
    );
  }

  Widget buildTodo(BuildContext context) => Container(
    color: Colors.brown.shade100,
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          value: todo!.isDone ?? false,
          onChanged: (_) {
            final provider = Provider.of<TodosProvider>(context, listen: false);
            final isDone = provider.toggleTodoStatus(todo!);

            Utils.showSnackBar(
              context, isDone! ? 'Task completed' : 'Task marked incomplete',
            );
          },
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo!.title.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                ),
              ),
              if (todo!.description!.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    todo!.description.toString(),
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                )
            ],
          ),
        ),
      ],
    ),
  );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditTodoPage(todo: todo),
    ),
  );
}