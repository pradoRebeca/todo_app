import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tasks_list/model/label_model.dart';

class LabelsNoteRepository extends ChangeNotifier {
  List<LabelModel> labelsNote = [];

  UnmodifiableListView<LabelModel> get list => UnmodifiableListView(labelsNote);

  void addOrRemove(LabelModel label) {
    bool exist = labelsNote.contains(label);

    if (exist) {
      labelsNote.removeWhere((item) => item.id == label.id);
    }

    if (!exist) {
      labelsNote.add(label);
    }

    notifyListeners();
  }

  void addAll(List<LabelModel> label) {
    labelsNote.addAll(label);

    notifyListeners();
  }

  void clear() {
    labelsNote.clear();
  }
}
