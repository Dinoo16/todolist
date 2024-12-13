import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:todo_list/model/items.dart';

import 'Widgets/card_body_widget.dart';
import 'Widgets/card_model_button.dart';

void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: ToDoList()));
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<DataItems> items = [];

  void _handleAddTask(String name) {
    final now = DateTime.now();
    final newItem = DataItems(
        id: '${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}',
        name: name);
    print(now.hour);
    print(DateTime.parse('$now'));
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoList", style: TextStyle(fontSize: 40)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: items
              .map((item) => CardBody(
                    index: items.indexOf(item),
                    item: item,
                    handleDeleteTask: _handleDeleteTask,
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return ModelButton(addTask: _handleAddTask);
              });
        },
        backgroundColor: Colors.blue, // Changes the background color
        elevation: 10.0, // Adds shadow elevation
        shape: RoundedRectangleBorder(
          // Custom shape
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add, size: 40),
      ),
    );
  }
}
