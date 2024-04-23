import 'package:flutter/material.dart';
import 'package:tasks_list/components/theme_mode_card.dart';
import 'package:tasks_list/screens/label_screen.dart';
import 'package:tasks_list/screens/archive_screen.dart';
import 'package:tasks_list/screens/note_screen.dart';
import 'package:tasks_list/screens/trash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreenIndex = 0;

  final List<Map<String, dynamic>> screens = [
    {
      'destination': const NoteScreen(),
      'icon': Icons.lightbulb_outline,
      'title': 'Notes'
    },
    {
      'destination': const LabelScreen(),
      'icon': Icons.edit_outlined,
      'title': 'Edit labels'
    },
    {
      'destination': const ArchiveScreen(),
      'icon': Icons.archive_outlined,
      'title': 'Archive'
    },
    {
      'destination': const TrashScreen(),
      'icon': Icons.delete_outline,
      'title': 'Trash'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screens[currentScreenIndex]['title']),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // DrawerHeader(child: Text("sdd")),
            Expanded(
                child: NavigationDrawer(
              selectedIndex: currentScreenIndex,
              onDestinationSelected: handleScreenChanged,
              children: [
                ...screens.map(
                  (item) => NavigationDrawerDestination(
                      icon: Icon(item['icon']), label: Text(item['title'])),
                ),
              ],
            )),
            // const SizedBox(
            //   height: 100,
            //   child: ,
            // ),
            ThemeModeCard()
          ],
        ),
      ),
      body: screens[currentScreenIndex]['destination'],
    );
  }

  void handleScreenChanged(int selectedScreen) {
    setState(() => currentScreenIndex = selectedScreen);
  }
}
