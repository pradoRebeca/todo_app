import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/components/label_chip.dart';
import 'package:tasks_list/model/note_model.dart';
import 'package:tasks_list/repository/note_repository.dart';
import 'package:tasks_list/screens/edit_note_screen.dart';
import 'package:tasks_list/utils/show_alert_dialog.dart';

class NoteCard extends StatefulWidget {
  final NoteModel note;
  const NoteCard({super.key, required this.note});

  @override
  createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  late NoteRepository notes;

  @override
  Widget build(BuildContext context) {
    notes = Provider.of<NoteRepository>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                EditNoteScreen(note: widget.note, editing: true))),
        child: Ink(
          decoration: BoxDecoration(
              color: widget.note.color,
              border: widget.note.color == Colors.transparent
                  ? Border.all(color: Theme.of(context).colorScheme.outline)
                  : null,
              borderRadius: BorderRadius.circular(15)),
          child: Container(
            constraints: const BoxConstraints(minHeight: 100),
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.note.title != null && widget.note.title!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      widget.note.title!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                Text(
                  widget.note.content,
                  style: widget.note.title == null || widget.note.title!.isEmpty
                      ? Theme.of(context).textTheme.titleMedium
                      : null,
                ),
                if (widget.note.labels.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Wrap(
                      spacing: 5.0,
                      children: [
                        ...widget.note.labels.map((label) => LabelChip(
                              text: label.title,
                              color: widget.note.color,
                            ))
                      ],
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      widget.note.getCreatedAt(),
                      style: Theme.of(context).textTheme.bodySmall?.merge(
                          TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant)),
                    )),
                    if (!widget.note.archived && !widget.note.deleted)
                      IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () =>
                              notes.changeArchiveStatus(widget.note),
                          tooltip: "Archive",
                          icon: const Icon(Icons.archive_outlined)),
                    if (widget.note.archived && !widget.note.deleted)
                      IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () =>
                              notes.changeArchiveStatus(widget.note),
                          tooltip: "Unachive",
                          icon: const Icon(Icons.unarchive_outlined)),
                    if (!widget.note.deleted)
                      IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () =>
                              notes.changeDeleteStatus(widget.note),
                          tooltip: "Move to trash",
                          icon: const Icon(Icons.delete_outline)),
                    if (widget.note.deleted) ...[
                      IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () => showAlertDialog(
                              context: context,
                              onConfirm: () =>
                                  notes.removePermanently(widget.note),
                              title: "Remove ${widget.note.title}?",
                              content:
                                  "This action will removed the label from the note, do you really want to do this?"),
                          tooltip: "Delete forever",
                          icon: const Icon(Icons.delete_forever)),
                      IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () =>
                              notes.changeDeleteStatus(widget.note),
                          tooltip: "Restore archive",
                          icon: const Icon(
                            Icons.restore_from_trash,
                          ))
                    ]
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
