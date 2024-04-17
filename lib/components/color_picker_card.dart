import 'package:flutter/material.dart';

class ColorPickerCard extends StatefulWidget {
  final Function onChange;
  const ColorPickerCard({super.key, required this.onChange});

  @override
  createState() => _ColorPickerCardState();
}

class _ColorPickerCardState extends State<ColorPickerCard> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    final Brightness theme = Theme.of(context).brightness;

    List<Color?> colors = Brightness.dark == theme ? darkMode : lightMode;

    return Wrap(
      runAlignment: WrapAlignment.start,
      spacing: 9, // spacing: 10,
      runSpacing: 10,
      children: colors.asMap().entries.map((entry) {
        int index = entry.key;
        Color? color = entry.value;

        return InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            widget.onChange(color);
            setState(() {
              indexSelected = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: color,
            ),
            width: 45,
            height: 45,
            child: indexSelected == index
                ? Icon(
                    Icons.check,
                    color:
                        Brightness.dark == theme ? Colors.white : Colors.black,
                  )
                : null,
          ),
        );
      }).toList(),
    );
  }
}

List<Color?> darkMode = [
  Colors.red[800],
  Colors.blue[800],
  Colors.green[800],
  Colors.cyan[800],
  Colors.grey[800],
  Colors.pink[800],
  Colors.purple[800],
  Colors.orange[800],
  Colors.teal[800],
  Colors.brown[800],
  Colors.indigo[800],
];

List<Color?> lightMode = [
  Colors.red[300],
  Colors.blue[300],
  Colors.green[300],
  Colors.cyan[300],
  Colors.grey[300],
  Colors.pink[300],
  Colors.purple[300],
  Colors.orange[300],
  Colors.teal[300],
  Colors.brown[300],
  Colors.indigo[400],
];
