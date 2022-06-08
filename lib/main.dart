import 'package:flutter/material.dart';
import 'package:to_do_list_app/presentation/home_screen.dart';
import 'package:to_do_list_app/presentation/screens/alarms_screen.dart';
import 'package:to_do_list_app/presentation/screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo Kest',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      //Configuracion para modo oscuro
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: Colors.deepPurple)),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
      initialRoute: "/",
      routes: {
        "/alarms": (context) => const AlarmsScreen(),
        "/todo": (context) => const ToDoScreen()
      },
    );
  }
}
