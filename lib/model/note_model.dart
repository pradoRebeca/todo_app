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

  String getCreatedAt() {
    int day = createdAt.day; // Obtém o dia
    int month = createdAt.month; // Obtém o mês
    int year = createdAt.year;

    return "${verifyIntLength(day)}-${verifyIntLength(month)}-$year";
  }

  String verifyIntLength(int number) {
    return "${number.toString().length < 2 ? '0$number' : number}";
  }
}
