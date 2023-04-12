import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';

///solo lectura
final simpleNamePrivider =
    Provider<String>((ref) => RandomGenerator.getRandomName());
