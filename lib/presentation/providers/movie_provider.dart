import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/movie.dart';
import '../../data/repositories/movie_repository.dart';

final moviesProvider =
    StateNotifierProvider<MoviesNotifier, AsyncValue<List<Movie>>>((ref) {
      final repository = ref.watch(movieRepositoryProvider);
      return MoviesNotifier(repository);
    });

final searchMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifier, AsyncValue<List<Movie>>>((ref) {
      final repository = ref.watch(movieRepositoryProvider);
      return SearchMoviesNotifier(repository);
    });

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Movie>>(
  (ref) {
    final repository = ref.watch(movieRepositoryProvider);
    return FavoritesNotifier(repository);
  },
);

class MoviesNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final MovieRepository _repository;
  int _currentPage = 1;
  bool _hasMore = true;

  MoviesNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadMovies();
  }

  Future<void> loadMovies() async {
    if (state.isLoading || !_hasMore) return;

    try {
      final movies = await _repository.getMovies(page: _currentPage);
      if (movies.isEmpty) {
        _hasMore = false;
        return;
      }

      _currentPage++;
      final currentMovies = state.value ?? [];
      state = AsyncValue.data([...currentMovies, ...movies]);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> refresh() async {
    _currentPage = 1;
    _hasMore = true;
    state = const AsyncValue.loading();
    await loadMovies();
  }
}

class SearchMoviesNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final MovieRepository _repository;

  SearchMoviesNotifier(this._repository) : super(const AsyncValue.data([]));

  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = const AsyncValue.data([]);
      return;
    }

    state = const AsyncValue.loading();
    try {
      final movies = await _repository.searchMovies(query);
      state = AsyncValue.data(movies);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

class FavoritesNotifier extends StateNotifier<List<Movie>> {
  final MovieRepository _repository;

  FavoritesNotifier(this._repository) : super([]) {
    loadFavorites();
  }

  void loadFavorites() {
    state = _repository.getFavorites();
  }

  Future<void> toggleFavorite(Movie movie) async {
    await _repository.toggleFavorite(movie);
    loadFavorites();
  }
}
