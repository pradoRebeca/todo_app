import 'package:flutter/material.dart';
import 'package:tasks_list/model/label_model.dart';

class LabelCard extends StatefulWidget {
  final LabelModel label;
  const LabelCard({super.key, required this.label});

  @override
  State<LabelCard> createState() => _LabelCardState();
}

class _LabelCardState extends State<LabelCard> {
  TextEditingController labelControler = TextEditingController();

  bool editing = false;

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {},
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
    editingSetState();

    //TODO: ImplementsSaveMethod
  }
}
