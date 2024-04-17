import 'package:flutter/material.dart';
import 'package:tasks_list/model/bookmark_model.dart';

class NoteModel {
  String? title;
  String content;
  Color? color;
  DateTime? createdAt;
  DateTime? updateAt;
  bool deleted;
  List<BookmarkModel>? bookmarks;

  NoteModel(
      {this.title,
      required this.content,
      this.color,
      this.bookmarks,
      this.deleted = true});
}
