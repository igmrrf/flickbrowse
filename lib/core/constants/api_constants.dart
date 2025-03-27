class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p';
  static const String posterSize = 'w500';
  static const String backdropSize = 'original';

  // Add your TMDB API key here
  static const String apiKey = 'apikey';

  static String getPosterUrl(String path) => '$imageBaseUrl/$posterSize$path';
  static String getBackdropUrl(String path) =>
      '$imageBaseUrl/$backdropSize$path';
}
