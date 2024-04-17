import 'package:flutter/material.dart';
import 'package:tasks_list/components/note_card.dart';
import 'package:tasks_list/model/label_model.dart';
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
              content: 'teste',
              color: index.isOdd ? Colors.red[200] : null,
              labels: [
                LabelModel(title: 'text'),
                LabelModel(title: 'text'),
              ]),
        ),
        itemCount: 6,
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
