import 'package:flutter/material.dart';
import 'package:zemin_istanbul_hive_app/core/service/cache/base_cache_manager.dart';
import 'package:zemin_istanbul_hive_app/core/service/cache/cache_box_names.dart';
import '../../core/service/network/network_manager.dart';
import '../../model/todo_model.dart';

class TodoService {
  final String appbarTitle = 'Todo List';
  final NetworkManager _networkManager = NetworkManager();
  final String _todoParameter = 'todos';
  final BaseCacheManager<Todo> _manager = BaseCacheManager<Todo>(CacheBoxNames.todo);

  Future<void> serviceInit() async {
    await _manager.openBox();
  }

  Future<List<Todo>?> getTodoListItems() async {
    await serviceInit();

    List<Todo>? items = _manager.getAllItems();

    if (items != null && items.isNotEmpty) {
      debugPrint("From Cache");
      return items;
    }

    dynamic response = await _networkManager.getRequest(_todoParameter);
    if (response is List) {
      List<Todo> todoList = response.map((e) => Todo.fromJson(e)).toList();
      debugPrint("From Network");
      _manager.saveAllItems(todoList);
      return todoList;
    }

    return null;
  }

  Future<void> saveTodoListItemsToCache(List<Todo>? items) async {
    _manager.saveAllItems(items);
  }
}
