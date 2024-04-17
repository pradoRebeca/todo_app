import 'package:flutter/material.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({super.key});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreen();
}

class _EditNoteScreen extends State<EditNoteScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                    onPressed: () {},
                    child: const Icon(Icons.palette),
                  ))
            ],
          ),
        ));
  }
}
