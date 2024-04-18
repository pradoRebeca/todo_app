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

  void remove(LabelModel label) {}

  void edit(LabelModel label) {}
}
