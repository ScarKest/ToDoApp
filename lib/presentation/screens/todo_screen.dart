import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  var tasks = <Widget>[];
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Por Hacer"),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          controller: _controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: "Nueva Tarea"),
          textInputAction: TextInputAction.done,
          onSubmitted: (value) {
            tasks.add(createTask(value));
            _controller.clear();
          },
        ),
      ),
      body: ListView(
        children: tasks,
      ),
    );
  }
}

Widget createTask(String title) {
  return ListTile(
    leading: Checkbox(value: false, onChanged: (value) {}),
    title: Text(title),
  );
}
