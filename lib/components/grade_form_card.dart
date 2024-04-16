import 'package:flutter/material.dart';

class GradeFormCard extends StatefulWidget {
  const GradeFormCard({super.key});

  @override
  State<GradeFormCard> createState() => _GradeFormCardState();
}

class _GradeFormCardState extends State<GradeFormCard> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: SizedBox(
      height: 300,
      width: 500,
      // color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            buildCounter: (BuildContext context,
                {int? currentLength, int? maxLength, bool? isFocused}) {
              return null;
            },
            maxLength: 55,
            minLines: 1,
            maxLines: 2,
            controller: title,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: const InputDecoration(
                hintText: 'Title', border: InputBorder.none),
          ),
          Expanded(
            child: TextFormField(
              maxLines: null,
              controller: content,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  hintText: 'Create a grade...', border: InputBorder.none),
              expands: true,
            ),
          )
        ],
      ),
    ));
  }
}

void showGradeForm(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        content: const GradeFormCard(),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              )),
          TextButton(onPressed: () {}, child: const Text("Save")),
        ],
      );
    },
  );
}
