import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/components/empty_data_card.dart';
import 'package:tasks_list/components/note_card.dart';
import 'package:tasks_list/repository/note_repository.dart';

class TrashScreen extends StatefulWidget {
  const TrashScreen({super.key});

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteRepository>(builder: (context, notes, child) {
      if (notes.listDeleted.isNotEmpty) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return NoteCard(
              note: notes.listDeleted[index],
            );
          },
          itemCount: notes.listDeleted.length,
        );
      }

      return const EmptyDataCard(
          icon: Icons.delete_outline, message: "No notes in trash");
    });
  }
}
