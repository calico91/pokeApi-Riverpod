import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';
import 'package:riverpod_app/presentation/providers/todos_state_notifier_provider.dart';

class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
      ),
      body: const TodosView(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            ref.read(stateNotifierProvider.notifier).addTodo();
          }),
    );
  }
}

class TodosView extends ConsumerWidget {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final filtroActual = ref.watch(todoFilterProvider);
    final todos = ref.watch(stateNotifierProvider);

    return Column(
      children: [
        SegmentedButton(
          segments: const [
            ButtonSegment(value: TodoFilter.all, icon: Text('Todos')),
            ButtonSegment(value: TodoFilter.completed, icon: Text('Invitados')),
            ButtonSegment(
                value: TodoFilter.pending, icon: Text('No invitados')),
          ],
          selected: <TodoFilter>{filtroActual},
          onSelectionChanged: (value) {
            ref
                .read(todoFilterProvider.notifier)
                .update((state) => value.first);

            //ref.read(todoFilterProvider.notifier).state = value.first;
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return SwitchListTile(
                  title: Text(todo.description),
                  value: todo.done,
                  onChanged: (value) {});
            },
          ),
        )
      ],
    );
  }
}
