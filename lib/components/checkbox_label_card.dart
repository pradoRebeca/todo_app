import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/components/add_label_card.dart';
import 'package:tasks_list/model/label_model.dart';
import 'package:tasks_list/repository/label_repository.dart';
import 'package:tasks_list/repository/labels_note_repository.dart';

class CheckboxLabelCard extends StatefulWidget {
  const CheckboxLabelCard({super.key});

  @override
  State<CheckboxLabelCard> createState() => _CheckboxLabelCardState();
}

class _CheckboxLabelCardState extends State<CheckboxLabelCard> {
  bool createLabel = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Column(
        children: [
          Expanded(
            child: Consumer2<LabelRepository, LabelsNoteRepository>(
              builder: (context, labels, labelNote, child) => ListView.builder(
                itemBuilder: (
                  context,
                  index,
                ) {
                  LabelModel label = labels.list[index];
                  return CheckboxListTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    selectedTileColor: Colors.red[100],
                    title: Text(label.title),
                    value: labelNote.list.contains(label),
                    onChanged: (value) => addOrRemoveLabel(label),
                  );
                },
                itemCount: labels.list.length,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              // padding: ,
              alignment: Alignment.center,
              constraints: const BoxConstraints(minHeight: 70),
              decoration: BoxDecoration(
                  // color: Colors.red,
                  border: !createLabel
                      ? Border(
                          top: BorderSide(
                              color: Theme.of(context).colorScheme.outline))
                      : null),
              child: Column(
                children: [
                  if (createLabel) const AddLabelCard(),
                  if (!createLabel)
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => setState(() {
                        createLabel = !createLabel;
                      }),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void addOrRemoveLabel(LabelModel label) {
    LabelsNoteRepository labelsNoteRepository =
        Provider.of<LabelsNoteRepository>(context, listen: false);

    labelsNoteRepository.addOrRemove(label);
  }
}
