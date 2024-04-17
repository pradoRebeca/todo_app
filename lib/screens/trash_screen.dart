import 'package:flutter/material.dart';
import 'package:tasks_list/components/note_card.dart';
import 'package:tasks_list/model/label_model.dart';
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
            // color: index.isOdd ? Colors.blue[100] : null,;
            color: index.isOdd ? const Color.fromARGB(255, 11, 61, 104) : null,
            deleted: true,
            labels: [
              LabelModel(title: 'text'),
            ]),
      ),
      itemCount: 3,
    );
  }
}
