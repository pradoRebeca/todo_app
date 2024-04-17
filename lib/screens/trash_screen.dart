import 'package:flutter/material.dart';
import 'package:tasks_list/components/note_card.dart';
import 'package:tasks_list/model/bookmark_model.dart';
import 'package:tasks_list/model/note_model.dart';

class TrashScreen extends StatefulWidget {
  const TrashScreen({super.key});

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => NoteCard(
        note: NoteModel(
            title: 'teste',
            content: 'testeeeeeeeee',
            color: Colors.blue,
            deleted: true,
            bookmarks: [
              BookmarkModel(title: 'text'),
            ]),
      ),
      itemCount: 3,
    );
  }
}
