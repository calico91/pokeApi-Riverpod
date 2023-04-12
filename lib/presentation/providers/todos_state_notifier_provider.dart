import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import 'package:riverpod_app/domain/domain.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();
final stateNotifierProvider =  StateNotifierProvider<TodosNotifier,List<Todo>>((ref) {
  return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier()
      : super([
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: _uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null)
        ]);

  void addTodo() {
    state = [
      ...state,
      Todo(
          id: _uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null)
    ];
  }
}
