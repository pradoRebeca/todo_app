import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/repository/label_repository.dart';
import 'package:tasks_list/repository/note_repository.dart';
import 'package:tasks_list/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LabelRepository()),
      ChangeNotifierProvider(
        create: (context) => NoteRepository(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}
