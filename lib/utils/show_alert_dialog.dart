import 'package:flutter/material.dart';

Future showAlertDialog(
    {required BuildContext context,
    required Function onConfirm,
    String title = 'Attention',
    String content = 'Do you really want to take this action?'}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            )),
        TextButton(
            onPressed: () => {onConfirm(), Navigator.pop(context)},
            child: const Text("Confirm")),
      ],
    ),
  );
}
