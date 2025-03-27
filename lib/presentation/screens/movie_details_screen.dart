import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/constants/api_constants.dart';
import '../../core/models/movie.dart';
import '../providers/movie_provider.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.any((m) => m.id == movie.id);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  movie.backdropPath != null
                      ? Image.network(
                        ApiConstants.getBackdropUrl(movie.backdropPath!),
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Center(child: Icon(Icons.error)),
                      )
                      : Container(color: Colors.grey),
            ),
            actions: [
              IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      ref
                          .read(favoritesProvider.notifier)
                          .toggleFavorite(movie);
                    },
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shake(duration: 200.ms, delay: 200.ms)
                  .scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2))
                  .then(delay: 200.ms)
                  .scale(
                    begin: const Offset(1.2, 1.2),
                    end: const Offset(1, 1),
                  ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ).animate().fadeIn().slideX(),
                    if (movie.releaseDate != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Release Date: ${movie.releaseDate}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ).animate().fadeIn().slideX(delay: 200.ms),
                    ],
                    if (movie.voteAverage != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            movie.voteAverage!.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ).animate().fadeIn().slideX(delay: 400.ms),
                    ],
                    if (movie.overview != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        'Overview',
                        style: Theme.of(context).textTheme.titleLarge,
                      ).animate().fadeIn().slideX(delay: 600.ms),
                      const SizedBox(height: 8),
                      Text(
                        movie.overview!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ).animate().fadeIn().slideX(delay: 800.ms),
                    ],
                    if (movie.genres.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(
                        'Genres',
                        style: Theme.of(context).textTheme.titleLarge,
                      ).animate().fadeIn().slideX(delay: 1000.ms),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children:
                            movie.genres
                                .map((genre) => Chip(label: Text(genre)))
                                .toList(),
                      ).animate().fadeIn().slideX(delay: 1200.ms),
                    ],
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
