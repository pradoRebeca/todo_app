import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/components/empty_data_card.dart';
import 'package:tasks_list/components/note_card.dart';
import 'package:tasks_list/repository/note_repository.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteRepository>(builder: (context, notes, child) {
      if (notes.listArchived.isNotEmpty) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return NoteCard(
              note: notes.listArchived[index],
            );
          },
          itemCount: notes.listArchived.length,
        );
      }

      return const EmptyDataCard(
          icon: Icons.label, message: "Your archived notes appear here");
    });
  }
}
