import 'package:flutter/material.dart';
import 'package:tasks_list/components/color_picker_card.dart';

Future showColorPicker(
  BuildContext context,
  Color? colorSelected,
  Function onChange,
) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Select color"),
      content: ColorPickerCard(
        onChange: onChange,
        colorSelected: colorSelected,
      ),
    ),
  );
}
