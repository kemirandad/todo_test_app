import 'package:flutter/material.dart';
import 'package:myapp/domain/entities/task.dart';
import 'package:myapp/presentation/provider/todo_provider.dart';
import 'package:myapp/presentation/utils/dialog_utils.dart';
import 'package:provider/provider.dart';

class MyTask extends StatelessWidget {
  final Task task;

  const MyTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();
    final colors = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            DialogUtils.showTaskDialog(context, task: task);
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: (8.0), vertical: (4.0)),
            child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                tileColor: colors.inversePrimary,
                leading: Checkbox(
                  value: task.isDone,
                  onChanged: (value) {
                    todoProvider.toggleTask(task);
                  },
                ),
                title: Text(
                  task.title,
                  style: TextStyle(
                      decoration:
                          task.isDone ? TextDecoration.lineThrough : null,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  task.body,
                  style: TextStyle(
                      decoration:
                          task.isDone ? TextDecoration.lineThrough : null,
                      color: colors.inverseSurface),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    todoProvider.deleteTask(task);
                  },
                )),
          ),
        ),
      ],
    );
  }
}
