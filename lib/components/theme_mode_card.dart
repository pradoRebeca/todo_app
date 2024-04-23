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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isDark) const Icon(Icons.dark_mode_outlined),
              if (!isDark) const Icon(Icons.light_mode_outlined),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("App theme"),
                    Text(
                      "${isDark ? 'Dark' : 'Light'} mode",
                      style: Theme.of(context).textTheme.bodySmall?.merge(
                          TextStyle(
                              color: Theme.of(context).colorScheme.outline)),
                    )
                  ],
                ),
              ),
            ],
          ),
          // ToggleButtons(children: [

          // ], isSelected: isSelected)

          Switch(
            value: isDark,
            activeColor: Theme.of(context).colorScheme.primaryContainer,
            onChanged: (value) =>
                Provider.of<ThemeModeRepository>(context, listen: false)
                    .changeThemeData(),
          ),
        ],
      ),
    );
  }
}
