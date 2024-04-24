import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/repository/label_repository.dart';
import 'package:tasks_list/repository/labels_note_repository.dart';
import 'package:tasks_list/repository/note_repository.dart';
import 'package:tasks_list/repository/theme_mode__repository.dart';
import 'package:tasks_list/screens/home_screen.dart';

//pradoRebeca - GitHub

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LabelRepository()),
      ChangeNotifierProvider(create: (context) => NoteRepository()),
      ChangeNotifierProvider(create: (context) => LabelsNoteRepository()),
      ChangeNotifierProvider(create: (context) => ThemeModeRepository())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeRepository>(
      builder: (context, value, child) => MaterialApp(
        title: 'Keep',
        theme: ThemeData(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode:
            Provider.of<ThemeModeRepository>(context, listen: false).themeMode,
        home: const HomeScreen(),
      ),
    );
  }
}
