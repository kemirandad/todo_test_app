import 'package:flutter/material.dart';

import 'package:myapp/domain/entities/task.dart';
import 'package:myapp/presentation/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class DialogUtils {
  static void showTaskDialog(BuildContext context, {Task? task}) {
    final TodoProvider todoProvider = context.read<TodoProvider>();
    final TextEditingController titleController = TextEditingController();

    if (task != null) {
      titleController.text =
          task.title; // Si es una tarea existente, establecer el título
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(task == null ? 'Type a new task' : 'Update Task'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Type a new task'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
            ),
            TextButton(
              child: Text(task == null ? 'Add' : 'Update'),
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  if (task == null) {
                    // Crear nueva tarea
                    todoProvider.addTask(
                      Task(
                        title: titleController.text,
                        body: 'New Task Body',
                      ),
                    );
                    titleController.clear();
                  } else {
                    // Actualizar tarea existente
                    task.title = titleController.text;                    
                    todoProvider.updateTask(task);
                  }
                  Navigator.of(context).pop(); // Cerrar el diálogo
                }
              },
            ),
          ],
        );
      },
    );
  }
}
