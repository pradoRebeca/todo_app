import 'package:flutter/material.dart';
import 'package:tasks_list/components/label_card.dart';
import 'package:tasks_list/model/label_model.dart';

class LabelScreen extends StatefulWidget {
  const LabelScreen({super.key});

  @override
  createState() => _LabelScreenState();
}

class _LabelScreenState extends State<LabelScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (
            context,
            index,
          ) {
            // if (index.isOdd) {
            //   return const Divider();
            // }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: LabelCard(
                label: LabelModel(title: 'label $index'),
              ),
            );
          },
          itemCount: 5,
        ),
        Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ))
      ],
    );
  }
}
