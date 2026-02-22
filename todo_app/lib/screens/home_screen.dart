import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            setState(() {
              todoList.add("New Todo");
            });
          },
          child: Icon(
            Icons.add
          ),
        ),
      );
  }
}