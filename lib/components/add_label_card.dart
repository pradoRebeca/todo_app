import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/model/label_model.dart';
import 'package:tasks_list/repository/label_repository.dart';

class AddLabelCard extends StatefulWidget {
  final bool? layoutInCheckbox;
  const AddLabelCard({super.key, this.layoutInCheckbox});

  @override
  State<AddLabelCard> createState() => _AddLabelCardState();
}

class _AddLabelCardState extends State<AddLabelCard> {
  TextEditingController label = TextEditingController();

  late LabelRepository listLabels;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      // constraints: const BoxConstraints(
      //   minHeight: 100,
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            child: TextFormField(
                controller: label,
                decoration: InputDecoration(
                    hintText: 'Maths - Sr. Brown',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    // border: In,
                    prefixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                    suffixIcon: IconButton(
                        onPressed: () => onSave(), icon: Icon(Icons.done)))),
          ),
          if (widget.layoutInCheckbox != null)
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
