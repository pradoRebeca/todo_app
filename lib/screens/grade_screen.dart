import 'package:flutter/material.dart';
import 'package:tasks_list/components/grade_card.dart';
import 'package:tasks_list/components/grade_form_card.dart';
import 'package:tasks_list/model/bookmark_model.dart';
import 'package:tasks_list/model/grade_model.dart';

class GradeScreen extends StatefulWidget {
  const GradeScreen({super.key});

  @override
  createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
        itemBuilder: (context, index) => GradeCard(
          grade: GradeModel(
              title: 'teste',
              content: 'testeeeeeeeee',
              color: Colors.red,
              bookmarks: [
                BookmarkModel(title: 'text'),
                BookmarkModel(title: 'text'),
                BookmarkModel(title: 'text'),
              ]),
        ),
        itemCount: 20,
      ),
      Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              showGradeForm(context);
            },
            child: const Icon(Icons.add),
          ))
    ]);
  }

  // void _showModalBottomSheet(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: GradeFormCard(),
  //       );
  //     },
  //   );
  // }
}
