import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/components/color_picker_card.dart';
import 'package:tasks_list/components/checkbox_label_card.dart';
import 'package:tasks_list/components/label_chip.dart';
import 'package:tasks_list/model/label_model.dart';
import 'package:tasks_list/model/note_model.dart';
import 'package:tasks_list/repository/labels_note_repository.dart';
import 'package:tasks_list/repository/note_repository.dart';

class EditNoteScreen extends StatefulWidget {
  final NoteModel? note;
  final bool editing;
  const EditNoteScreen({super.key, this.note, this.editing = false});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreen();
}

class _EditNoteScreen extends State<EditNoteScreen> {
  Color? backgroundColor;

  late TextEditingController title;
  late TextEditingController content;
  late NoteRepository listNote;
  late LabelsNoteRepository labelsNoteRepository;

  @override
  void initState() {
    super.initState();

    content = TextEditingController(text: widget.note?.title ?? "");
    title = TextEditingController(text: widget.note?.title ?? "");
    backgroundColor = widget.note?.color;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.editing && widget.note!.labels.isNotEmpty) {
        labelsNoteRepository.addAll(widget.note!.labels);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    listNote = Provider.of<NoteRepository>(context, listen: false);
    labelsNoteRepository =
        Provider.of<LabelsNoteRepository>(context, listen: false);

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          leading: BackButton(
            onPressed: () => popScreen(),
          ),
          actions: [
            IconButton(
              tooltip: 'Show Labels',
              onPressed: () => showListLabelCard(context),
              icon: const Icon(Icons.label),
            ),
            IconButton(
              tooltip: 'Show pallete',
              icon: const Icon(Icons.palette),
              onPressed: () {
                showColors(context);
              },
            ),
            IconButton(
              onPressed: () => onSave(),
              icon: const Icon(Icons.done),
              tooltip: 'Save',
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Stack(
            children: [
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(minHeight: 30),
                    child: TextFormField(
                      buildCounter: (BuildContext context,
                          {int? currentLength,
                          int? maxLength,
                          bool? isFocused}) {
                        return null;
                      },
                      maxLines: null,
                      controller: title,
                      keyboardType: TextInputType.multiline,
                      // expands: true,
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: const InputDecoration(
                          hintText: 'Title', border: InputBorder.none),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: content,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          hintText: 'Take a note...', border: InputBorder.none),
                      expands: true,
                    ),
                  )
                ],
              )),
              Positioned(
                  bottom: 16,
                  right: 0,
                  child: Consumer<LabelsNoteRepository>(
                    builder: (context, labelsNote, child) => Wrap(
                      spacing: 5.0,
                      children: [
                        ...labelsNote.list.map((label) => LabelChip(
                              text: label.title,
                              color: backgroundColor,
                              onDelete: () => onDeleteChip(label),
                            ))
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }

  void onSave() {
    List<LabelModel> labels = List.from(labelsNoteRepository.list);

    if (widget.editing) {
      widget.note!.color = backgroundColor;
      widget.note!.content = content.text;
      widget.note!.labels = labels;
      widget.note!.title = title.text;

      listNote.edit(widget.note!);
    }

    if (!widget.editing) {
      NoteModel note = NoteModel(
          content: content.text,
          title: title.text,
          color: backgroundColor,
          labels: labels);
      listNote.add(note);
    }

    popScreen();
  }

  void popScreen() {
    labelsNoteRepository.clear();
    Navigator.pop(context);
  }

  void onDeleteChip(LabelModel label) async {
    await Future.delayed(const Duration(milliseconds: 600));
    labelsNoteRepository.addOrRemove(label);
  }

  void showColors(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select color"),
        content: ColorPickerCard(
          onChange: (Color? color) {
            setState(() {
              if (color != null) {
                backgroundColor = color;
              }
            });
            // Handle main color changes
          },
        ),
      ),
    );
  }

  void showListLabelCard(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        scrollable: true,
        title: Text("Select labels"),
        content: CheckboxLabelCard(),
      ),
    );
  }
}
