import 'package:flutter/material.dart';

class LabelChip extends StatefulWidget {
  final Color? color;
  final String text;
  final Function? onDelete;
  const LabelChip({super.key, this.color, required this.text, this.onDelete});

  @override
  State<LabelChip> createState() => _LabelChipState();
}

class _LabelChipState extends State<LabelChip> {
  @override
  Widget build(BuildContext context) {
    Color? colorTheme =
        widget.color ?? Theme.of(context).colorScheme.surfaceContainerHigh;

    BorderSide? borderTheme = widget.color != null
        ? BorderSide(color: Theme.of(context).colorScheme.outline)
        : BorderSide.none;

    return widget.onDelete != null
        ? InputChip(
            color: WidgetStateProperty.all(widget.color),
            onDeleted: () => widget.onDelete!(),
            label: Text(widget.text),
            backgroundColor: colorTheme,
            tooltip: "Label ${widget.text}",
            side: borderTheme)
        : Chip(
            label: Text(widget.text),
            backgroundColor: colorTheme,
            side: borderTheme);
  }
}
