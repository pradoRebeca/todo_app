import 'package:flutter/material.dart';
import 'package:tasks_list/components/note_card.dart';
import 'package:tasks_list/model/bookmark_model.dart';
import 'package:tasks_list/model/note_model.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => NoteCard(
        note: NoteModel(
            title: 'teste',
            content: 'testeeeeeeeee',
            color: Colors.green,
            bookmarks: [
              BookmarkModel(title: 'text'),
              BookmarkModel(title: 'text'),
              BookmarkModel(title: 'text'),
            ]),
      ),
      itemCount: 3,
    );
  }
}
