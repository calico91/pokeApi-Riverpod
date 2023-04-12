import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    int counterProvider = ref.watch(counterState);
    bool modoOscuroV = ref.watch(modoOscuro);
    String name = ref.watch(randonName);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          IconButton(
            // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
            icon: modoOscuroV
                ? const Icon(Icons.dark_mode_outlined, size: 100)
                : const Icon(Icons.light_mode_outlined, size: 100),
            onPressed: () {
              ref.read(modoOscuro.notifier).update((state) => !state);
            },
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 50,
            ),
            label: Text(counterProvider.toString(),
                style: const TextStyle(fontSize: 100)),
            onPressed: () {
              ref.read(counterState.notifier).update((state) {
                return state + 1;
              });
            },
          ),
          const Spacer(flex: 2),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () {
          ref.invalidate(randonName);
          //ref.read(randonName.notifier).update((state) => state);
        },
      ),
    );
  }
}
