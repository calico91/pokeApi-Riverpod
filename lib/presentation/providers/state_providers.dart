import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';

final counterState = StateProvider.autoDispose<int>((ref) {
  return 0;
});
final modoOscuro = StateProvider<bool>((ref) {
  return false;
});

final randonName =
    StateProvider<String>((ref) => RandomGenerator.getRandomName());
