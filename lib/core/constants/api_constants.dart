class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p';
  static const String posterSize = 'w500';
  static const String backdropSize = 'original';

  // Add your TMDB API key here
  static const String apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZGEwMTJjZjBmNWJjZTJmMTIzZTVkYTUyMjNkM2QwMCIsIm5iZiI6MTc0MzEwNDk0Ny41NDIsInN1YiI6IjY3ZTVhYmIzNWYzZTBhYzE4ODAwM2E3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ngzQDlHzMrWcpkiV48NSWCUywnwxcLWy74lpCEgEq3E';

  static String getPosterUrl(String path) => '$imageBaseUrl/$posterSize$path';
  static String getBackdropUrl(String path) =>
      '$imageBaseUrl/$backdropSize$path';
}
