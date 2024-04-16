import 'package:flutter/material.dart';
import 'package:tasks_list/components/grade_card.dart';
import 'package:tasks_list/model/bookmark_model.dart';
import 'package:tasks_list/model/grade_model.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => GradeCard(
        grade: GradeModel(
            title: 'teste',
            content: 'testeeeeeeeee',
            color: Colors.green,
            bookmarks: [
              BookmarkModel(title: 'text'),
              BookmarkModel(title: 'text'),
              BookmarkModel(title: 'text'),
            ]),
      ),
      itemCount: 3,
    );
  }
}
