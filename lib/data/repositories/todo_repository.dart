

import 'package:dio/dio.dart';
import 'package:flutter_rest_api_example/data/models/todo.dart';

class TodoRepository {
  List<Todo>? todoList = [];
  Dio dio = Dio();

  Future<List<Todo>>? fetchTodoByUserID(String userID) async {
      var response = await dio.get('https://jsonplaceholder.typicode.com/users/$userID/todos');
    if (response.statusCode == 200) {
      var loadedTodos = <Todo>[];
      response.data.forEach((todo) {
        var todoModel = Todo.fromJson(todo);
        loadedTodos.add(todoModel);
        todoList = loadedTodos;
        return todoList!;
      });
    }
    return todoList!;
  }
}