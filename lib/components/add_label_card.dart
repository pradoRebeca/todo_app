import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/model/label_model.dart';
import 'package:tasks_list/repository/label_repository.dart';
import 'package:tasks_list/repository/labels_note_repository.dart';

class AddLabelCard extends StatefulWidget {
  const AddLabelCard({
    super.key,
  });

  @override
  State<AddLabelCard> createState() => _AddLabelCardState();
}

class _AddLabelCardState extends State<AddLabelCard> {
  TextEditingController label = TextEditingController();

  late LabelRepository labelRepository;
  late LabelsNoteRepository labelsNoteRepository;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
          controller: label,
          onChanged: (value) => setState(() {}),
          decoration: InputDecoration(
              hintText: 'Enter label name',
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: label.text.isNotEmpty ? () => onSave() : null,
                icon: const Icon(
                  Icons.add,
                ),
                color: Theme.of(context).colorScheme.primary,
              ))),
    );
  }

  void onSave() {
    if (label.text.isNotEmpty) {
      labelRepository = Provider.of<LabelRepository>(context, listen: false);
      labelsNoteRepository =
          Provider.of<LabelsNoteRepository>(context, listen: false);

      LabelModel newLabel = LabelModel(title: label.text);

      labelRepository.add(newLabel);
      labelsNoteRepository.addOrRemove(newLabel);

      setState(() => label.clear());

      return;
    }
  }
}
