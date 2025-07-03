import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/gif.dart';
import '../screens/detail_screen.dart';
import '../providers/gif_provider.dart';

class GifGrid extends ConsumerStatefulWidget {
  final List<Gif> gifs;

  const GifGrid({super.key, required this.gifs});

  @override
  ConsumerState<GifGrid> createState() => _GifGridState();
}

class _GifGridState extends ConsumerState<GifGrid> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // If we're near the bottom, load more
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(gifProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      itemCount: widget.gifs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust based on orientation if needed
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final gif = widget.gifs[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailScreen(gif: gif)),
            );
          },
          child: Image.network(
            gif.url,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
