import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

enum TodoFilter { all, completed, pending }

const uuid = Uuid();
final todoFilterProvider = StateProvider<TodoFilter>((ref) => TodoFilter.all);

final todosProvider = StateProvider<List<Todo>>((ref) {
  return [
    Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null),
    Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: DateTime.now()),
    Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null),
    Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: DateTime.now()),
  ];
});

final filtroTodoProviders = Provider<List<Todo>>((ref) {
  final todo = ref.watch(todosProvider);

  switch (ref.watch(todoFilterProvider)) {
    case TodoFilter.all:
      return todo;
    case TodoFilter.completed:
      return todo.where((element) => element.done).toList();
    case TodoFilter.pending:
      return todo.where((element) => !element.done).toList();
  }
});
