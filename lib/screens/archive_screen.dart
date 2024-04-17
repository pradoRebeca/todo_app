import 'package:flutter/material.dart';
import 'package:tasks_list/components/note_card.dart';
import 'package:tasks_list/model/label_model.dart';
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
            labels: [
              LabelModel(title: 'text'),
              LabelModel(title: 'text'),
              LabelModel(title: 'text'),
            ]),
      ),
      itemCount: 3,
    );
  }
}
