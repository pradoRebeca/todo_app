import 'package:uuid/uuid.dart';

class LabelModel {
  String id;
  String title;

  static Uuid uuid = const Uuid();

  LabelModel({required this.title}) : id = uuid.v4();
}
