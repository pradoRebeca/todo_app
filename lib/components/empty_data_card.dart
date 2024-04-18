import 'package:flutter/material.dart';

class EmptyDataCard extends StatefulWidget {
  final IconData icon;
  final String message;
  const EmptyDataCard({super.key, required this.icon, required this.message});

  @override
  createState() => _EmptyDataCardState();
}

class _EmptyDataCardState extends State<EmptyDataCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 50,
            color: Theme.of(context).colorScheme.outline,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              widget.message,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
