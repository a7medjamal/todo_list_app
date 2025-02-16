// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Map<String, String>> tasks = [
    {'task': 'Communication Systems Quiz', 'time': '10:00 AM'},
    {'task': 'OS Report', 'time': '11:00 AM'},
    {'task': 'Buy some stuff', 'time': '1:00 PM'},
    {'task': 'Go to the Gym', 'time': '2:00 PM'},
    {'task': 'Flutter Task', 'time': '4:00 PM'},
    {'task': 'Flutter Task بردو', 'time': '6:00 PM'},
  ];

  void _deleteTask(int index) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(),
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            title: Text('Delete'),
            content: Text(
              'Are you sure you want to delete this item?',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
                onPressed: () {
                  setState(() {
                    tasks.removeAt(index);
                  });
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4368FF),
      appBar: AppBar(
        title: Text(
          'Todo List',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4368FF),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                tasks[index]['task']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                tasks[index]['time']!,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade200),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.white),
                onPressed: () => _deleteTask(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
