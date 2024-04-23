import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:tasks_list/model/label_model.dart';
import 'package:tasks_list/model/note_model.dart';

class NoteRepository extends ChangeNotifier {
  List<NoteModel> notes = [];

  UnmodifiableListView<NoteModel> get list => UnmodifiableListView(
      notes.where((item) => item.deleted == false && item.archived == false));

  UnmodifiableListView<NoteModel> get listDeleted =>
      UnmodifiableListView(notes.where((item) => item.deleted == true));

  UnmodifiableListView<NoteModel> get listArchived => UnmodifiableListView(
      notes.where((item) => item.archived == true && item.deleted == false));

  void add(NoteModel note) {
    notes.insert(0, note);

    notifyListeners();
  }

  void edit(NoteModel note) {
    for (var i = 0; i < notes.length; i++) {
      if (notes[i].id == note.id) {
        notes[i] = note;
      }
    }

    notifyListeners();
  }

  void removeLabelNote(LabelModel label) {
    for (var i = 0; i < notes.length; i++) {
      if (notes[i].labels.isNotEmpty) {
        notes[i].labels.removeWhere((item) => item.id == label.id);
      }
    }

    notifyListeners();
  }

  void removePermanently(NoteModel note) {
    notes.removeWhere((item) => item.id == note.id);

    notifyListeners();
  }

  void changeDeleteStatus(NoteModel note) {
    for (var i = 0; i < notes.length; i++) {
      if (notes[i].id == note.id) {
        notes[i].deleted = !notes[i].deleted;
      }
    }

    notifyListeners();
  }

  void changeArchiveStatus(NoteModel note) {
    for (var i = 0; i < notes.length; i++) {
      if (notes[i].id == note.id) {
        notes[i].archived = !notes[i].archived;
      }
    }

    notifyListeners();
  }
}
