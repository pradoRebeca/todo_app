import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tasks_list/model/label_model.dart';

class LabelRepository extends ChangeNotifier {
  List<LabelModel> labels = [];

  UnmodifiableListView<LabelModel> get list => UnmodifiableListView(labels);

  void add(LabelModel label) {
    labels.add(label);
    notifyListeners();
  }

  void remove(LabelModel label) {
    labels.removeWhere((item) => item.id == label.id);
    notifyListeners();
  }

  void edit(LabelModel label, String newLabel) {
    for (var i = 0; i < labels.length; i++) {
      if (labels[i].id == label.id) {
        labels[i].title = newLabel;
      }
    }
  }

  notifyListeners();
}
