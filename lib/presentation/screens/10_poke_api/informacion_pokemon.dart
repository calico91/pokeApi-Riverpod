import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformacionPokemon extends ConsumerWidget {
  final String id;

  const InformacionPokemon(
    this.id, 
 
  );

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text(id),
        
      ),
    );
  }
}
