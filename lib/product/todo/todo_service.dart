import 'package:flutter/material.dart';
import '../../core/service/network/network_manager.dart';
import '../../model/todo_model.dart';

class TodoService {
  final String appbarTitle = 'Todo List';
  final NetworkManager _networkManager = NetworkManager();
  final String _todoParameter = 'todos';

  Future<void> serviceInit() async {}

  Future<List<Todo>?> getTodoListItems() async {
    await serviceInit();

    dynamic response = await _networkManager.getRequest(_todoParameter);
    if (response is List) {
      List<Todo> todoList = response.map((e) => Todo.fromJson(e)).toList();
      debugPrint("From Network");
      return todoList;
    }

    return null;
  }

  Future<void> saveTodoListItemsToCache(List<Todo>? items) async {}
}
