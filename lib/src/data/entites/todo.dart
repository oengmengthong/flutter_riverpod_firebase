import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  const Todo({
    required this.description,
    required this.id,
    this.completed = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  final String id;
  final String description;
  final bool completed;

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  @override
  String toString() {
    return 'Todo(description: $description, completed: $completed)';
  }
}
