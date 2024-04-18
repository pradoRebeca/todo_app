import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/model/label_model.dart';
import 'package:tasks_list/repository/label_repository.dart';

class LabelCard extends StatefulWidget {
  final LabelModel label;

  LabelCard({
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

  @override
  Widget build(BuildContext context) {
    listLabels = Provider.of<LabelRepository>(context, listen: false);

    return Container(
        constraints: const BoxConstraints(minHeight: 75),
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
                      onPressed: () => editingSetState(),
                      icon: const Icon(
                        Icons.edit,
                      )),
                  IconButton(
                      onPressed: () => remove(),
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.errorContainer,
                      ))
                ],
                if (editing) ...[
                  IconButton(
                      onPressed: () => saveLabel(),
                      icon: const Icon(
                        Icons.done,
                      )),
                  IconButton(
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
    listLabels.edit(widget.label, labelControler.text);

    editingSetState();
  }

  void remove() {
    listLabels.remove(widget.label);

    editingSetState();
  }
}
