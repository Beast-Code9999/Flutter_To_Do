import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:uuid/uuid.dart';
import 'package:todo_app/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  final _uuid = Uuid();
  List<Todo> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList = [
      Todo(id: _uuid.v4(), title: 'Run'),
      Todo(id: _uuid.v4(), title: 'Gym'),
      Todo(id: _uuid.v4(), title: 'Read'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo List")),
      body: ListView.builder( // builds the list
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final currentTodo = todoList[index];

          return TodoItem( // imported widget
            todo: currentTodo, 
            onTap: () { 
              setState(() { // toggle between isComplted and not isComplited
                currentTodo.isCompleted = !currentTodo.isCompleted;
              });
            }, 
            onDismissed: () {
              setState(() { // Remove todo item
                todoList.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar( // show message of removed item
                SnackBar(content: Text("${currentTodo.title} deleted")),
              );
            },
            onLongPress: () { // Edit on long press
              _textController.text = currentTodo.title; // Prefil the title with currentTodo
              showDialog( 
                context: context, 
                builder: (context) {
                  return AlertDialog( 
                    title: Text("Edit Todo"), 
                    content: TextField(controller: _textController),
                    actions: [
                      TextButton( // Cancel Dialog
                        onPressed: () {
                          Navigator.pop(context);
                          _textController.clear();
                        },
                        child: Text("Cancel")
                      ),
                      TextButton( // Save Dialog and update the text todo.title with with the text in textController
                        onPressed: () {
                          if (_textController.text.isNotEmpty) {
                            setState(() {
                              currentTodo.title = _textController.text;
                              
                            });
                            _textController.clear();
                            Navigator.pop(context);
                          }
                        }, 
                        child: Text("Save")
                      )
                    ],
                  );  
              });
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () { // Add Todo Item
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Todo"),
                content: TextField(controller: _textController),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        setState(() {
                          todoList.add(
                            Todo(id: _uuid.v4(), title: _textController.text),
                          );
                        });
                      }
                      _textController.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }


  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}




