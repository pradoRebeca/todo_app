import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/model/label_model.dart';
import 'package:tasks_list/repository/label_repository.dart';
import 'package:tasks_list/repository/note_repository.dart';
import 'package:tasks_list/utils/show_alert_dialog.dart';

class LabelCard extends StatefulWidget {
  final LabelModel label;

  const LabelCard({
    super.key,
    required this.label,
  });

  @override
  State<LabelCard> createState() => _LabelCardState();
}

class _LabelCardState extends State<LabelCard> {
  TextEditingController labelControler = TextEditingController();

  bool editing = false;

  late LabelRepository listLabels;
  late NoteRepository noteRepository;

  @override
  Widget build(BuildContext context) {
    listLabels = Provider.of<LabelRepository>(context, listen: false);
    noteRepository = Provider.of<NoteRepository>(context, listen: false);

    return Container(
        constraints: const BoxConstraints(minHeight: 60),
        decoration: BoxDecoration(
            border: editing
                ? Border.all(color: Theme.of(context).colorScheme.outline)
                : null,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (editing)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: labelControler..text = widget.label.title,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
            if (!editing)
              Text(
                widget.label.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            Row(
              children: [
                if (!editing) ...[
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () => editingSetState(),
                      icon: const Icon(
                        Icons.edit,
                      )),
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () => showAlertDialog(
                          context: context,
                          onConfirm: remove,
                          title: "Remove ${widget.label.title}?",
                          content:
                              "This label will be removed from notes that are."),
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.errorContainer,
                      ))
                ],
                if (editing) ...[
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () => saveLabel(),
                      icon: const Icon(
                        Icons.done,
                      )),
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () => editingSetState(),
                      icon: const Icon(
                        Icons.close,
                      ))
                ]
              ],
            )
          ],
        ));
  }

  void editingSetState() {
    setState(() {
      editing = !editing;
    });
  }

  void saveLabel() {
    if (labelControler.text.isEmpty) {
      editingSetState();
      return;
    }

    listLabels.edit(widget.label, labelControler.text);
    editingSetState();
  }

  void remove() {
    listLabels.remove(widget.label);
    noteRepository.removeLabelNote(widget.label);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.label.title} was removed')),
    );
  }
}
