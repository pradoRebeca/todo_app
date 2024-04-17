import 'package:flutter/material.dart';
import 'package:tasks_list/model/label_model.dart';

class LabelCard extends StatefulWidget {
  final LabelModel label;
  const LabelCard({super.key, required this.label});

  @override
  State<LabelCard> createState() => _LabelCardState();
}

class _LabelCardState extends State<LabelCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minHeight: 75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.error,
                    ))
              ],
            )
          ],
        ));
  }
}
