import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/info_pokemones.dart';

class PokemonInformation {
  static Future<String> getPokemonName(int pokemonId) async {
    final dio = Dio();
    await Future.delayed(const Duration(seconds: 2));

    try {
      final response =
          await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');

      return response.data['name'] ?? 'Nombre no se encontro';
    } catch (e) {
      return 'Nombre no pudo ser obtenido';
    }
  }

  static Future<InfoPokemones> getPokemones() async {
    try {
      Uri url =
          Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=350&offset=0');
      final resp = await http.get(url);
      final listaPokemones = InfoPokemones.fromJson(json.decode(resp.body));

      return listaPokemones;
    } on Exception catch (_) {
      return Future.error('no se encontraron resultados');
    }
  }
}
