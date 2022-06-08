import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_app/domain/entities/task.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  late TextEditingController _controller;
  List<Task> tasksList = <Task>[];
  late SharedPreferences preferences;

  @override
  void initState() {
    _controller = TextEditingController();
    initData();
    super.initState();
  }

  void initData() async {
    preferences = await SharedPreferences.getInstance();
    loadData();
  }

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
            addTask(Task(title: value, complete: false));
            _controller.clear();
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 30),
        itemCount: tasksList.length,
        itemBuilder: createTask,
      ),
      floatingActionButton: clearData(),
    );
  }

  Widget createTask(BuildContext context, int index) {
    return ListTile(
      trailing: Checkbox(
          value: tasksList[index].complete,
          onChanged: (value) => setCompleted(tasksList[index])),
      title: Text(tasksList[index].title),
    );
  }

  void saveData() {
    List<String> task =
        tasksList.map((item) => json.encode(item.toMap())).toList();
    preferences.setStringList("tasks", task);
  }

  void loadData() {
    List<String>? tasks = preferences.getStringList("tasks");
    if (tasks != null) {
      tasksList = tasks.map((task) => Task.fromMap(json.decode(task))).toList();
      setState(() {});
    }
  }

  void addTask(Task task) async {
    setState(() {});
    tasksList.add(task);
    saveData();
  }

  void setCompleted(Task task) =>
      setState(() => task.complete = !task.complete);

  void removeTask(Task task) => setState(() => tasksList.remove(task));

  Widget clearData() {
    return FloatingActionButton(
      child: const Icon(Icons.delete),
      onPressed: () async => setState(() {
        preferences.clear();
        tasksList.clear();
      }),
    );
  }
}
