import 'package:flutter/material.dart';
import 'package:flutter_provider/models/todo_models.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [];

  addNewTodo(title, description) {
    var newTodo = Todo(title: title, description: description);
    todos.add(newTodo);
    notifyListeners();
  }

  deleteTodo(index) {
    todos.removeAt(index);
    notifyListeners();
  }
}
