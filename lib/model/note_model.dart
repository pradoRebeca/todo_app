import 'package:flutter/material.dart';
import 'package:tasks_list/model/label_model.dart';

class NoteModel {
  String? title;
  String content;
  Color? color;
  DateTime? createdAt;
  DateTime? updateAt;
  bool deleted;
  List<LabelModel>? labels;

  NoteModel(
      {this.title,
      required this.content,
      this.color,
      this.labels,
      this.deleted = true});
}
