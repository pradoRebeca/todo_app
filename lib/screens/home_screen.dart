import 'package:flutter/material.dart';
import 'package:tasks_list/screens/bookmark_screen.dart';
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
    // {
    //   'destination': FileScreen(),
    //   'icon': Icons.notifications_outlined,
    //   'title': 'Stick notes'
    // },
    {
      'destination': const BookmarkScreen(),
      'icon': Icons.edit_outlined,
      'title': 'Edit bookmarks'
    },
    {
      'destination': const ArchiveScreen(),
      'icon': Icons.file_download,
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
      drawer: NavigationDrawer(
        selectedIndex: currentScreenIndex,
        onDestinationSelected: handleScreenChanged,
        children: [
          ...screens.map(
            (item) => NavigationDrawerDestination(
                icon: Icon(item['icon']), label: Text(item['title'])),
          )
        ],
      ),
      body: screens[currentScreenIndex]['destination'],
    );
  }

  void handleScreenChanged(int selectedScreen) {
    setState(() => currentScreenIndex = selectedScreen);
  }
}
