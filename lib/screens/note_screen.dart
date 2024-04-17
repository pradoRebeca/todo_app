import 'package:flutter/material.dart';
import 'package:tasks_list/components/note_card.dart';
import 'package:tasks_list/model/bookmark_model.dart';
import 'package:tasks_list/model/note_model.dart';
import 'package:tasks_list/screens/edit_note_screen.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
        itemBuilder: (context, index) => NoteCard(
          note: NoteModel(
              title: 'teste',
              content: 'testeeeeeeeee',
              color: Colors.red,
              bookmarks: [
                BookmarkModel(title: 'text'),
                BookmarkModel(title: 'text'),
                BookmarkModel(title: 'text'),
              ]),
        ),
        itemCount: 20,
      ),
      Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const EditNoteScreen()));
            },
            child: const Icon(Icons.add),
          ))
    ]);
  }
}
