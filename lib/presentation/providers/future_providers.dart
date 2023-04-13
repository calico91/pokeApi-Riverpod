import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';

import '../../domain/entities/info_pokemones.dart';

final pokemonNameProvider = FutureProvider.autoDispose<String>((ref) async {
  final pokemonId = ref.watch(pokemonIdProvider);
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
});
final infoPokemones = FutureProvider<InfoPokemones>((ref) async {
  return await PokemonInformation.getPokemones();
});

final pokemonIdProvider = StateProvider<int>((ref) => 1);

final pokemonFamily =
    FutureProvider.family<String, int>((ref, pokemonId) async {
  final pokemonName = await PokemonInformation.getPokemonName(pokemonId);
  return pokemonName;
});
