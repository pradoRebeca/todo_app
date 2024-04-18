import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/model/label_model.dart';
import 'package:tasks_list/repository/label_repository.dart';

class AddLabelCard extends StatefulWidget {
  const AddLabelCard({super.key});

  @override
  State<AddLabelCard> createState() => _AddLabelCardState();
}

class _AddLabelCardState extends State<AddLabelCard> {
  TextEditingController label = TextEditingController();

  late LabelRepository listLabels;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 100, maxHeight: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            child: TextFormField(
                controller: label,
                decoration: const InputDecoration(
                  hintText: 'Maths - Sr. Brown',
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  )),
              TextButton(onPressed: () => onSave(), child: const Text("Save"))
            ],
          )
        ],
      ),
    );
  }

  void onSave() {
    if (label.text.isNotEmpty) {
      listLabels = Provider.of<LabelRepository>(context, listen: false);
      listLabels.add(LabelModel(title: label.text));

      Navigator.pop(context);

      return;
    }

    Navigator.pop(context);
  }
}
