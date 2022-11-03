import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController decriptionContrller = TextEditingController();

    final todos = Provider.of<TodoProvider>(context);

    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Column(
                      children: [
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Your title"),
                        ),
                        Divider(),
                        TextField(
                          controller: decriptionContrller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Your description"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              final title = titleController.text;
                              final description = decriptionContrller.text;
                              todos.addNewTodo(title, description);
                              Navigator.pop(context);
                            },
                            child: Text("Submit Your Data"))
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: todos.todos.length == 0
          ? Center(child: Text('There is Nothing'))
          : ListView.builder(
              itemCount: todos.todos.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  elevation: 5,
                  child: ListTile(
                    title: Text(todos.todos[index].title),
                    subtitle: Text(todos.todos[index].description),
                    trailing: IconButton(
                        onPressed: () {
                          todos.deleteTodo(index);
                        },
                        icon: Icon(Icons.delete)),
                  ),
                );
              },
            ),
    ));
  }
}
