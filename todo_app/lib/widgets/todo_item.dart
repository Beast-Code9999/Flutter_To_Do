import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onTap;
  final VoidCallback onDismissed;
  final VoidCallback onLongPress;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onDismissed,
    required this.onLongPress,
  });

  @override Widget build(BuildContext context) {
    return Dismissible(
            key: Key(todo.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) => onDismissed(), 
            
              // setState(() {
              //   todoList.removeAt(index);
              // });
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text("${todo.title} deleted")),
              // );
            child: ListTile(
              title: Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.isCompleted ? TextDecoration.lineThrough : null
                ),
                ),

              trailing: Icon(
                todo.isCompleted
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: todo.isCompleted ? Colors.green : Colors.grey,
              ),

              onTap: onTap,

              onLongPress: onLongPress,

                // setState(() {
                //   currentTodo.isCompleted = !currentTodo.isCompleted;
                // });
            ),
          );
  }
}
