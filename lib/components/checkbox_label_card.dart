import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/model/label_model.dart';
import 'package:tasks_list/repository/label_repository.dart';
import 'package:tasks_list/repository/labels_note_repository.dart';

class CheckboxLabelCard extends StatefulWidget {
  const CheckboxLabelCard({super.key});

  @override
  State<CheckboxLabelCard> createState() => _CheckboxLabelCardState();
}

class _CheckboxLabelCardState extends State<CheckboxLabelCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 300,
      child: Consumer2<LabelRepository, LabelsNoteRepository>(
        builder: (context, labels, labelNote, child) => ListView.builder(
          itemBuilder: (
            context,
            index,
          ) {
            LabelModel label = labels.list[index];
            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              title: Text(label.title),
              value: labelNote.list.contains(label),
              onChanged: (value) => addOrRemoveLabel(label),
            );
          },
          itemCount: labels.list.length,
        ),
      ),
    );
  }

  void addOrRemoveLabel(LabelModel label) {
    LabelsNoteRepository labelsNoteRepository =
        Provider.of<LabelsNoteRepository>(context, listen: false);

    labelsNoteRepository.addOrRemove(label);
  }
}
