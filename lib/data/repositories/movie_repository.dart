import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/constants/api_constants.dart';
import '../../core/models/movie.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepository(Dio(), Hive.box<Movie>('favorites'));
});

class MovieRepository {
  final Dio _dio;
  final Box<Movie> _favoritesBox;

  MovieRepository(this._dio, this._favoritesBox);

  Future<List<Movie>> getMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/movie/popular',
        queryParameters: {'Authorization': 'Bearer ${ApiConstants.apiKey}', 'page': page},
      );

      final movies =
          (response.data['results'] as List)
              .map((movie) => Movie.fromJson(movie))
              .map(
                (movie) => movie.copyWith(
                  isFavorite: _favoritesBox.containsKey(movie.id),
                ),
              )
              .toList();

      return movies;
    } catch (e) {
      throw Exception('Failed to fetch movies');
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    try {
      // In searchMovies method
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/search/movie',
        queryParameters: {'Authorization': 'Bearer ${ApiConstants.apiKey}', 'query': query},
      );

      final movies =
          (response.data['results'] as List)
              .map((movie) => Movie.fromJson(movie))
              .map(
                (movie) => movie.copyWith(
                  isFavorite: _favoritesBox.containsKey(movie.id),
                ),
              )
              .toList();

      return movies;
    } catch (e) {
      throw Exception('Failed to search movies');
    }
  }

  Future<Movie> toggleFavorite(Movie movie) async {
    try {
      final newFavoriteStatus = !movie.isFavorite;
      final updatedMovie = movie.copyWith(isFavorite: newFavoriteStatus);
      
      if (newFavoriteStatus) {
        await _favoritesBox.put(movie.id, updatedMovie);
      } else {
        await _favoritesBox.delete(movie.id);
      }
      
      return updatedMovie;
    } catch (e) {
      throw Exception('Failed to toggle favorite');
    }
  }

  List<Movie> getFavorites() {
    return _favoritesBox.values.toList();
  }
}
