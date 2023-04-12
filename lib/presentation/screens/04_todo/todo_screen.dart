import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider + Providers'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class _TodoView extends ConsumerWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context, ref) {
    final filtroActual = ref.watch(todoFilterProvider);
    //final todos = ref.watch(todosProvider);
    final filtrosTodo = ref.watch(filtroTodoProviders);
    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

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
            itemCount: filtrosTodo.length,
            itemBuilder: (context, index) {
              final todo = filtrosTodo[index];
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
