import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  List<String> todoList = ["Run", "Read", "Gym"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Todo List"),),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todoList[index])
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
                            todoList.add(_textController.text);
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