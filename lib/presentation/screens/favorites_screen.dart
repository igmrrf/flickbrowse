import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/movie_provider.dart';
import 'movie_list_screen.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites').animate().fadeIn().slideX(),
      ),
      body:
          favorites.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                          Icons.favorite_border,
                          size: 64,
                          color: Colors.grey,
                        )
                        .animate()
                        .scale(duration: 500.ms)
                        .then(delay: 200.ms)
                        .shake(),
                    const SizedBox(height: 16),
                    Text(
                      'No favorites yet',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(color: Colors.grey),
                    ).animate().fadeIn().slideY(),
                  ],
                ),
              )
              : GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final movie = favorites[index];
                  return MovieCard(
                    movie: movie,
                    onTap:
                        () => Navigator.pushNamed(
                          context,
                          '/movie-details',
                          arguments: movie,
                        ),
                  ).animate().fadeIn(
                    delay: Duration(milliseconds: index * 100),
                  );
                },
              ),
    );
  }
}
