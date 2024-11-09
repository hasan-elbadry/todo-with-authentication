import 'package:dio/dio.dart';
import 'package:todo_with_authentcation/models/todo_model.dart';

class ApiService {
  static var dio = Dio();

  static Future<List<TodoItemModel>> getAll() async {
    var response = await dio.get('https://dummyjson.com/todos?limit=10');
    return TodoModel.convertFromJson(response.data);
  }
}
