import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = "ToDo Kest";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: ListView(
        children: [
          option(
            context,
            title: "Por Hacer",
            route: "/todo",
            icon: Icons.check,
          ),
          option(
            context,
            title: "Alarmas",
            route: "/alarms",
            icon: Icons.alarm_on,
          )
        ],
      ),
    );
  }
}

Widget option(
  BuildContext context, {
  required String title,
  required String route,
  required IconData icon,
}) {
  return ListTile(
    title: Text(title),
    leading: Icon(icon),
    trailing: const Icon(Icons.keyboard_arrow_right),
    onTap: () => Navigator.pushNamed(context, route),
  );
}
