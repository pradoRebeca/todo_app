import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/components/empty_data_card.dart';
import 'package:tasks_list/components/note_card.dart';
import 'package:tasks_list/repository/note_repository.dart';
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
      Consumer<NoteRepository>(builder: (context, notes, child) {
        if (notes.list.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NoteCard(
                note: notes.list[index],
              );
            },
            itemCount: notes.list.length,
          );
        }

        return const EmptyDataCard(
            icon: Icons.lightbulb_outline,
            message: "Notes you add appear here");
      }),
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
