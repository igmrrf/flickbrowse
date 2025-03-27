import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/models/movie.dart';
import 'presentation/screens/favorites_screen.dart';
import 'presentation/screens/movie_details_screen.dart';
import 'presentation/screens/movie_list_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  await Hive.openBox<Movie>('favorites');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlickBrowse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MovieListScreen(),
        '/favorites': (context) => const FavoritesScreen(),
        '/movie-details':
            (context) => MovieDetailsScreen(
              movie: ModalRoute.of(context)!.settings.arguments as Movie,
            ),
      },
    );
  }
}
