import 'package:flutter/material.dart';
import 'package:tasks_list/components/label_card.dart';
import 'package:tasks_list/model/label_model.dart';

class ListLabelCard extends StatefulWidget {
  const ListLabelCard({super.key});

  @override
  State<ListLabelCard> createState() => _ListLabelCardState();
}

class _ListLabelCardState extends State<ListLabelCard> {
  bool labelChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: ListView.builder(
        itemBuilder: (
          context,
          index,
        ) =>
            CheckboxListTile(
          title: Text("Text $index"),
          value: labelChecked,
          onChanged: (value) {
            setState(() => labelChecked = !labelChecked);
          },
        ),
        itemCount: 10,
      ),
    );
  }
}
