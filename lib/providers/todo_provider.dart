import 'package:flutter/material.dart';
import 'package:todo_with_authentcation/services/api_service.dart';
import 'package:collection/collection.dart';
import '../models/todo_model.dart';

class todoProvider with ChangeNotifier {
  List<TodoItemModel> data = [];
  bool firstTime = true;

  Future<void> getAll() async {
    if (firstTime) {
      data = await ApiService.getAll();
      data = data.sortedBy<num>((k) => k.completed ? 0 : 1);
      firstTime = false;
    }
    notifyListeners();
  }

  void checkPressed(int index) {
    data[index].completed = !data[index].completed;
    notifyListeners();
  }

  void remove(int index) {
    data.removeAt(index);
    notifyListeners();
  }
}
