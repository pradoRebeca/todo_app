import 'package:flutter/material.dart';
import 'package:tasks_list/model/grade_model.dart';

class GradeCard extends StatefulWidget {
  final GradeModel grade;
  const GradeCard({super.key, required this.grade});

  @override
  createState() => _GradeCardState();
}

class _GradeCardState extends State<GradeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Container(
        constraints: const BoxConstraints(minHeight: 100),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: widget.grade.color ?? Theme.of(context).colorScheme.surface,
            border: widget.grade.color == null
                ? Border.all(color: Theme.of(context).colorScheme.outline)
                : null,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.grade.title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.grade.title!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            Text(widget.grade.content),
            if (widget.grade.bookmarks != null &&
                widget.grade.bookmarks!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Wrap(
                  spacing: 5.0,
                  children: [
                    ...widget.grade.bookmarks!.map((bookmark) => InputChip(
                          label: Text(bookmark.title),
                          backgroundColor: Colors.blue,
                        ))
                  ],
                ),
              ),
            if (widget.grade.deleted)
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
