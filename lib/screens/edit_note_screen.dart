import 'package:flutter/material.dart';
import 'package:tasks_list/components/color_picker_card.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreen();
}

class _EditNoteScreen extends State<EditNoteScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {},
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
                      minLines: null,
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
                  child: FloatingActionButton(
                    onPressed: () {
                      showColors(context);
                    },
                    child: const Icon(Icons.palette),
                  ))
            ],
          ),
        ));
  }

  void showColors(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select color"),
        content: ColorPickerCard(onChange: (Color? color) {
          setState(() {
            if (color != null) {
              backgroundColor = color;
            }
          });
          // Handle main color changes
        }),
      ),
    );
  }
}
