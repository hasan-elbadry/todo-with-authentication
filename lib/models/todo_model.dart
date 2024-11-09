class TodoModel {
  static List<TodoItemModel> convertFromJson(dynamic json) {
    List<TodoItemModel> allData = [];
    for (int i = 0; i < 10; i++) {
      allData.add(TodoItemModel(
          id: json['todos'][i]['id'],
          todo: json['todos'][i]['todo'],
          completed: json['todos'][i]['completed']));
    }
    print(allData);
    return allData;
  }
}

class TodoItemModel {
  TodoItemModel(
      {required this.id, required this.todo, required this.completed});

  int id;
  String todo;
  bool completed;
}
