import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/repository/theme_mode__repository.dart';

class ThemeModeCard extends StatefulWidget {
  const ThemeModeCard({super.key});

  @override
  State<ThemeModeCard> createState() => _ThemeModeCardState();
}

class _ThemeModeCardState extends State<ThemeModeCard> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeModeRepository>(
          context,
        ).themeMode ==
        ThemeMode.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          value: isDark,
          onChanged: (value) =>
              Provider.of<ThemeModeRepository>(context, listen: false)
                  .changeThemeData(),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text("Dark Theme"),
        )
      ],
    );
  }
}
