import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/gif_provider.dart';
import '../widgets/gif_grid.dart';
import '../utils/debouncer.dart';


class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gifs = ref.watch(gifProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Giphy Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search GIFs',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _debouncer.run(() {
                  ref.read(gifProvider.notifier).search(value);
                });
              },
            ),
          ),
          Expanded(
            child: gifs.when(
              data: (items) => GifGrid(gifs: items),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
