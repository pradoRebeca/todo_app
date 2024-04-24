import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/components/label_chip.dart';
import 'package:tasks_list/model/label_model.dart';
import 'package:tasks_list/model/note_model.dart';
import 'package:tasks_list/repository/labels_note_repository.dart';
import 'package:tasks_list/repository/note_repository.dart';
import 'package:tasks_list/utils/show_alert_dialog.dart';
import 'package:tasks_list/utils/show_color_picker.dart';
import 'package:tasks_list/utils/show_label_note.dart';

class EditNoteScreen extends StatefulWidget {
  final NoteModel? note;
  final bool editing;
  const EditNoteScreen({super.key, this.note, this.editing = false});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreen();
}

class _EditNoteScreen extends State<EditNoteScreen> {
  late Color backgroundColor;
  late TextEditingController title;
  late TextEditingController content;
  late NoteRepository listNote;
  late LabelsNoteRepository labelsNoteRepository;

  @override
  void initState() {
    super.initState();

    content = TextEditingController(text: widget.note?.title ?? "");
    title = TextEditingController(text: widget.note?.title ?? "");
    backgroundColor = widget.note?.color ?? Colors.transparent;

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
        appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: backgroundColor,
          leading: BackButton(
            onPressed: () => onBack(),
          ),
          actions: [
            IconButton(
              tooltip: 'Show Labels',
              onPressed: () => showLabelNote(context),
              icon: const Icon(Icons.label),
            ),
            IconButton(
              tooltip: 'Show pallete',
              icon: const Icon(Icons.palette),
              onPressed: () => showColorPicker(
                  context, backgroundColor, changeBackgroundColor),
            ),
            IconButton(
              onPressed: () => onSave(),
              icon: const Icon(Icons.done),
              tooltip: 'Save',
            )
          ],
        ),
        body: Container(
          color: backgroundColor,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Form(
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
                            hintText: 'Take a note...',
                            border: InputBorder.none),
                        expands: true,
                      ),
                    )
                  ],
                )),
              ),
              Positioned(
                bottom: 10,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 40,
                  child: Consumer<LabelsNoteRepository>(
                    builder: (context, labelsNote, child) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(
                            right: 8.0, left: index == 0 ? 16 : 0),
                        child: LabelChip(
                          text: labelsNote.list[index].title,
                          color: backgroundColor,
                          onDelete: () => onDeleteChip(labelsNote.list[index]),
                        ),
                      ),
                      itemCount: labelsNote.list.length,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void onBack() {
    if (content.text.isEmpty) {
      showAlertDialog(
          content: "When exiting, changes will not be saved.",
          context: context,
          onConfirm: popScreen);
      return;
    }

    popScreen;
  }

  bool validateNote() {
    if (content.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No content!')),
      );
      return false;
    }

    return true;
  }

  void editNote(List<LabelModel> labels) {
    widget.note!.color = backgroundColor;
    widget.note!.content = content.text;
    widget.note!.labels = labels;
    widget.note!.title = title.text;

    listNote.edit(widget.note!);
  }

  void createNote(List<LabelModel> labels) {
    NoteModel note = NoteModel(
        content: content.text,
        title: title.text,
        color: backgroundColor,
        labels: labels);
    listNote.add(note);
  }

  void onSave() {
    List<LabelModel> labels = List.from(labelsNoteRepository.list);
    bool validate = validateNote();

    if (!validate) {
      return;
    }

    if (widget.editing) {
      editNote(labels);
      return;
    }

    createNote(labels);
    popScreen();
  }

  void onDeleteChip(LabelModel label) async {
    await Future.delayed(const Duration(milliseconds: 600));
    labelsNoteRepository.addOrRemove(label);
  }

  void changeBackgroundColor(Color? color) {
    setState(() {
      if (color != null) {
        backgroundColor = color;
      }
    });
    // Handle main color changes
  }

  void popScreen() {
    labelsNoteRepository.clear();
    Navigator.pop(context);
  }
}
