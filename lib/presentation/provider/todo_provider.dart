import 'package:flutter/material.dart';
import 'package:myapp/domain/entities/task.dart';

class TodoProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
        title: 'Take a walk with Abril',
        body: 'Don\'t forget it',
        isDone: false),
    Task(title: 'Drink more water', body: 'Don\'t forget it', isDone: false),
  ];

  List<Task> get getTask {
    _tasks.sort((a, b) => a.isDone ? 1 : -1);
    return _tasks;
  }

  void toggleTask(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    final index = _tasks.indexOf(task);
    _tasks[index] = task;
    notifyListeners();
  }
}
