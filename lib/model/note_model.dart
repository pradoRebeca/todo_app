import 'package:flutter/material.dart';
import 'package:tasks_list/model/label_model.dart';
import 'package:uuid/uuid.dart';

class NoteModel {
  String id;
  String? title;
  String content;
  Color color;
  DateTime createdAt = DateTime.now();
  DateTime? updateAt;
  bool deleted;
  bool archived;
  List<LabelModel> labels;

  static Uuid uuid = const Uuid();

  NoteModel(
      {this.title,
      required this.content,
      required this.color,
      required this.labels,
      this.deleted = false,
      this.archived = false})
      : id = uuid.v4();
}
