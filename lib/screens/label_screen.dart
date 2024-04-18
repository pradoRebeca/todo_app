import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/components/add_label_card.dart';
import 'package:tasks_list/components/empty_data.dart';
import 'package:tasks_list/components/label_card.dart';
import 'package:tasks_list/repository/label_repository.dart';

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
        Consumer<LabelRepository>(
          builder: (context, labels, child) {
            if (labels.list.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (
                  context,
                  index,
                ) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: LabelCard(
                      label: labels.list[index],
                    ),
                  );
                },
                itemCount: labels.list.length,
              );
            }

            return const EmptyData();
          },
        ),
        Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () => showAddLabel(context),
              child: const Icon(Icons.add),
            ))
      ],
    );
  }

  void showAddLabel(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: AddLabelCard(),
      ),
    );
  }
}
