import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class InformacionPokemon extends ConsumerWidget {
  final String id;

  const InformacionPokemon(this.id, {super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonAsync = ref.watch(infoPokemon(id));
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: pokemonAsync.when(
              data: (infoPokemon) => Text(infoPokemon.forms![0].name!),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const Center(child: LinearProgressIndicator())),
        ));
  }
}
