import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonAsync = ref.watch(pokemonNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (data) => Text(data),
          error: (error, stackTrace) => Text(error.hashCode.toString()),
          loading: () => const LinearProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          ref
              .read(pokemonIdProvider.notifier)
              .update((state) => state += state);
        },
      ),
    );
  }
}
