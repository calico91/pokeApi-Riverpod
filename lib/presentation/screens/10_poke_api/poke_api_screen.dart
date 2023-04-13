import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/domain/entities/info_pokemones.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';
import 'package:riverpod_app/presentation/screens/10_poke_api/informacion_pokemon.dart';

class PokeApi extends ConsumerWidget {
  const PokeApi({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonesAsync = ref.watch(infoPokemones);
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Container(
        child: pokemonesAsync.when(
          data: (listaPokemones) => GridView.builder(
            itemCount: listaPokemones.results!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
            itemBuilder: (BuildContext context, int i) {
              List chunks = listaPokemones.results![i].url!.split('/');
              final id = chunks[6];
              return GestureDetector(
                onTap: () {
                 
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InformacionPokemon(id)));
                },
                child: _tarjetaPokemon(
                    listaPokemones: listaPokemones, i: i, id: id),
              );
            },
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: LinearProgressIndicator()),
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

Widget _tarjetaPokemon(
    {required InfoPokemones listaPokemones,
    required int i,
    required String id}) {
  return Card(
    child: Stack(children: [
      Image.asset(
        'assets/pokeball.png',
      ),
      Center(
        child: Column(
          children: [
            Text('# $id'),
            const SizedBox(height: 20),
            Image(
              image: NetworkImage(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png'),
            ),
            const SizedBox(height: 20),
            Text(listaPokemones.results![i].name.toString()),
          ],
        ),
      ),
    ]),
  );
}
