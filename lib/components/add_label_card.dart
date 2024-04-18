import 'package:flutter/material.dart';

class AddLabelCard extends StatefulWidget {
  const AddLabelCard({super.key});

  @override
  State<AddLabelCard> createState() => _AddLabelCardState();
}

class _AddLabelCardState extends State<AddLabelCard> {
  TextEditingController label = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
          controller: label,
          decoration: const InputDecoration(
            hintText: 'Maths - Sr. Brown',
          )),
    );
  }
}
