import 'package:flutter/material.dart';
import 'package:tasks_list/model/bookmark_model.dart';

class GradeModel {
  String? title;
  String content;
  Color? color;
  DateTime? createdAt;
  DateTime? updateAt;
  bool deleted;
  List<BookmarkModel>? bookmarks;

  GradeModel(
      {this.title,
      required this.content,
      this.color,
      this.bookmarks,
      this.deleted = true});
}
