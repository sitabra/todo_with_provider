import 'package:flutter/cupertino.dart';
import '../model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Buy Food 😋',
      description: '''- Eggs
- Milk
- Bread
- Water''',
      isDone: false,
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Plan family trip to Norway',
      description: '''- Rent some hotels
- Rent a car
- Pack suitcase''',
      isDone: false,
    ),Todo(
      createdTime: DateTime.now(),
      title: 'Car Maintenance',
      description: '''- Break Oil change
- Mobil Change''
- Brakes Change''',
      isDone: false,
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false|| todo.isDone==null).toList();
  List<Todo> get todosComplete => _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool? toggleTodoStatus(Todo todo) {
    todo.isDone = !(todo.isDone!);
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}