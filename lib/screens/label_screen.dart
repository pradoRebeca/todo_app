import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_list/components/add_label_card.dart';
import 'package:tasks_list/components/empty_data_card.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.surfaceContainer),
              child: AddLabelCard(),
            ),
          ),
          // const Divider(),
          Expanded(child: Consumer<LabelRepository>(
            builder: (context, labels, child) {
              if (labels.list.isNotEmpty) {
                return ListView.builder(
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

              return const EmptyDataCard(
                  icon: Icons.label, message: "Your labels appear here");
            },
          )),
        ],
      ),
    );
  }
}
