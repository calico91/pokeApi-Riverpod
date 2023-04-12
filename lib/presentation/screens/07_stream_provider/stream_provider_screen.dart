import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/stream_provider.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const StreamView(),
    );
  }
}

class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userStreams = ref.watch(userStream);

    if (!userStreams.hasValue) {
      return const Center(
        child: LinearProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: userStreams.value?.length,
      itemBuilder: (_, i) {
        return ListTile(title: Text(userStreams.value![i]));
      },
    );
  }
}
