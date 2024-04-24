import 'package:flutter/material.dart';
import 'package:tasks_list/components/add_label_card.dart';
import 'package:tasks_list/components/checkbox_label_card.dart';

Future showLabelNote(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      scrollable: true,
      title: const Text("Label note"),
      content: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: const AddLabelCard(),
          ),
          const CheckboxLabelCard(),
        ],
      ),
    ),
  );
}
