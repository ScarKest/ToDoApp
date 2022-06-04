import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  late TextEditingController _controller;
  var titleTasks = List<String?>;
  var tasks = <Widget>[];

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
    getData();
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getStringList("tasks");
    setState(() {
      print("datos obtenidos $titleTasks");
      createTask(titleTasks);
    });
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
            titleTasks.add(value);
            addData(titleTasks!);
            _controller.clear();
          },
        ),
      ),
      body: ListView(
        children: [
          ...tasks,
          const SizedBox(height: 25),
        ],
      ),
      // floatingActionButton: clearData(),
    );
  }

  List<Widget> createTask(List<String>? tasksTitles) {
    if (tasksTitles != null) {
      for (var task in tasksTitles) {
        tasks.add(ListTile(
          leading: Checkbox(value: false, onChanged: (value) {}),
          title: Text(task),
        ));
      }
    }
    return tasks;
  }
}

void addData(List<String> tasks) async {
  final prefs = await SharedPreferences.getInstance();
  print("datos ingresados $tasks");
  prefs.setStringList("tasks", tasks);
}

Widget clearData() {
  return FloatingActionButton(
    child: const Icon(Icons.delete),
    onPressed: () async {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
    },
  );
}
