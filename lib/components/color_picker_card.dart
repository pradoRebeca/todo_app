import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/repository/theme_mode__repository.dart';

class ColorPickerCard extends StatefulWidget {
  final Function onChange;
  final Color? colorSelected;

  const ColorPickerCard(
      {super.key, required this.onChange, this.colorSelected});

  @override
  createState() => _ColorPickerCardState();
}

class _ColorPickerCardState extends State<ColorPickerCard> {
  Color? colorSelected;
  late ThemeMode theme;

  @override
  void initState() {
    super.initState();
    colorSelected = widget.colorSelected;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeMode theme =
        Provider.of<ThemeModeRepository>(context, listen: false).themeMode;
    Color colorTheme = Colors.transparent;

    if (!colors.contains(colorTheme)) {
      colors.add(colorTheme);
    }

    return Wrap(
      runAlignment: WrapAlignment.start,
      spacing: 9,
      runSpacing: 10,
      children: [
        if (colors.isNotEmpty)
          ...colors.map((colorOriginal) {
            Color color = colorOriginal == colorTheme
                ? colorTheme
                : colorOriginal.withOpacity(0.4);
            return InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                widget.onChange(color);
                setState(() => colorSelected = color);
              },
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: color == colorTheme
                      ? Border.all(
                          color: Theme.of(context).colorScheme.onSurface,
                        )
                      : null,
                  color: color,
                ),
                width: 45,
                height: 45,
                child: colorSelected == color
                    ? Icon(
                        Icons.check,
                        color: ThemeMode.dark == theme
                            ? Colors.white
                            : Colors.black,
                      )
                    : null,
              ),
            );
          })
      ],
    );
  }
}

List<Color> colors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.cyan,
  Colors.grey,
  Colors.pink,
  Colors.purple,
  Colors.orange,
  Colors.teal,
  Colors.brown,
  Colors.indigo,
];
