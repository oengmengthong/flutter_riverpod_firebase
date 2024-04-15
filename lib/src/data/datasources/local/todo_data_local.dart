import 'package:flutter_riverpod_firebase/src/data/entites/todo.dart';
import 'package:flutter_riverpod_firebase/src/shared/storage/storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class TodoDataLocal {
  TodoDataLocal({
    @Named('storage') required this.storage,
  });

  final Storage storage;

  // Function to get all todos
  Future<List<Todo>> getTodos() async {
    final todos = await storage.read<Map<String, dynamic>>('todos');
    return todos == null
        ? []
        : (todos as List)
            .map((e) => Todo.fromJson(e as Map<String, dynamic>))
            .toList();
  }

  // Function to add a `todo`
  Future<void> add(Todo todo) async {
    final todos = await getTodos();
    await storage.write('todos', [...todos, todo.toJson()]);
  }

  // Function to update a `todo`
  Future<void> update(Todo todo) async {
    final todos = await getTodos();
    await storage.write(
      'todos',
      todos.map((e) => e.id == todo.id ? todo.toJson() : e).toList(),
    );
  }

  // Function to delete a `todo`
  Future<void> delete(String id) async {
    final todos = await getTodos();
    await storage.write(
      'todos',
      todos.where((e) => e.id != id).map((e) => e.toJson()).toList(),
    );
  }
}
