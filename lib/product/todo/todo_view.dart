import 'package:flutter/material.dart';
import '../../model/todo_model.dart';
import 'todo_service.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final TodoService _service = TodoService();
  List<Todo>? todoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_service.appbarTitle),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [IconButton(onPressed: () => _service.saveTodoListItemsToCache(todoList), icon: const Icon(Icons.save))],
      ),
      body: FutureBuilder(
        future: _service.getTodoListItems(),
        builder: (BuildContext context, AsyncSnapshot<List<Todo>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            todoList = snapshot.data;
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              physics: const BouncingScrollPhysics(),
              children: List.generate(
                todoList?.length ?? 0,
                (index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: (todoList?[index].completed ?? false) ? Colors.green.shade200 : Colors.red.shade200,
                    child: ListTile(title: Text(todoList?[index].title ?? "", style: const TextStyle(color: Colors.black))),
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
