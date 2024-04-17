import 'package:flutter/material.dart';
import 'package:tasks_list/model/note_model.dart';

class NoteCard extends StatefulWidget {
  final NoteModel note;
  const NoteCard({super.key, required this.note});

  @override
  createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Container(
        constraints: const BoxConstraints(minHeight: 100),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: widget.note.color ?? Theme.of(context).colorScheme.surface,
            border: widget.note.color == null
                ? Border.all(color: Theme.of(context).colorScheme.outline)
                : null,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.note.title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.note.title!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            Text(widget.note.content),
            if (widget.note.labels != null && widget.note.labels!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Wrap(
                  spacing: 5.0,
                  children: [
                    ...widget.note.labels!.map((label) => Chip(
                        label: Text(label.title),
                        backgroundColor: widget.note.color ??
                            Theme.of(context).colorScheme.surfaceContainerHigh,
                        side: widget.note.color != null
                            ? BorderSide(
                                color: Theme.of(context).colorScheme.outline)
                            : BorderSide.none))
                  ],
                ),
              ),
            if (widget.note.deleted)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      tooltip: "Delete forever",
                      icon: const Icon(Icons.delete_forever)),
                  IconButton(
                      onPressed: () {},
                      tooltip: "Restore archive",
                      icon: const Icon(
                        Icons.restore_from_trash,
                      ))
                ],
              )
          ],
        ),
      ),
    );
  }
}
