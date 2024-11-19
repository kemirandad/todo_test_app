import 'package:flutter/material.dart';
import 'package:myapp/presentation/provider/todo_provider.dart';
import 'package:myapp/presentation/utils/dialog_utils.dart';
import 'package:myapp/presentation/widget/todo_widget/my_task.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ToDo App'),
          centerTitle: false,
        ),
        body: _TodoScreen(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: () {
            DialogUtils.showTaskDialog(context);
          },
          child: const Icon(Icons.add),
        ));
  }
}

class _TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();
    final sizeScreen = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: sizeScreen.width,
        height: sizeScreen.height,
        child: ListView.builder(
            itemCount: todoProvider.getTask.length,
            itemBuilder: (context, index) {
              final task = todoProvider.getTask[index];
              return MyTask(task: task);
            }),
      ),
    );
  }
}
