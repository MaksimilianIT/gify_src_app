import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api/giphy_api.dart';
import '../models/gif.dart';

final gifProvider = StateNotifierProvider<GifNotifier, AsyncValue<List<Gif>>>(
  (ref) => GifNotifier(),
);

class GifNotifier extends StateNotifier<AsyncValue<List<Gif>>> {
  GifNotifier() : super(const AsyncValue.data([]));

  final _api = GiphyApi();
  String _query = '';
  int _offset = 0;
  bool _isLoadingMore = false;

  void search(String query) async {
    _query = query;
    _offset = 0;
    state = const AsyncValue.loading();

    try {
      final gifs = await _api.searchGifs(query);
      state = AsyncValue.data(gifs);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || _query.isEmpty) return;

    _isLoadingMore = true;
    _offset += 25;

    try {
      final moreGifs = await _api.searchGifs(_query, offset: _offset);
      state = state.whenData((gifs) => [...gifs, ...moreGifs]);
    } catch (_) {}
    _isLoadingMore = false;
  }
}
