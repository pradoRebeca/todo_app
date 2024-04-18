import 'package:flutter/material.dart';

class EmptyData extends StatefulWidget {
  const EmptyData({Key? key}) : super(key: key);

  @override
  _EmptyDataState createState() => _EmptyDataState();
}

class _EmptyDataState extends State<EmptyData> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lightbulb_outline,
            size: 50,
            color: Theme.of(context).colorScheme.outline,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "Notes you add appear here",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
