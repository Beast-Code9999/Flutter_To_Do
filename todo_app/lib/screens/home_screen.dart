import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:uuid/uuid.dart';

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
        appBar: AppBar(title: Text("Todo List"),),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final currentTodo = todoList[index];

            return Dismissible(
              key: Key(currentTodo.id),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete, color: Colors.white,),
              ),
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${currentTodo.title} deleted")),
                );
              },
              
              child: ListTile(
                title: Text(currentTodo.title),
              ),
            );
          }
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context, 
              builder: (context){
                return AlertDialog(
                  title: Text("Add Todo"),
                  content: TextField(
                    controller: _textController,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if(_textController.text.isNotEmpty) {
                          setState(() {
                            todoList.add(Todo(id: _uuid.v4(), title: _textController.text));
                          });
                        }
                        _textController.clear();
                        Navigator.pop(context);
                      }, 
                      child: Text("Add"))
                  ],
                );
              });
          },
          child: Icon(
            Icons.add
          ),
        ),
      );
  }
}