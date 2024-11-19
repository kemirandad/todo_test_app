import 'package:flutter/material.dart';
import 'package:myapp/config/theme_app.dart';
import 'package:myapp/presentation/provider/todo_provider.dart';
import 'package:myapp/presentation/screen/todo_screen.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(const ToDoApp());
 
class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(colorSelector: 5).getTheme(),
        title: 'ToDo App',
        home: const TodoScreen()
      ),
    );
  }
}