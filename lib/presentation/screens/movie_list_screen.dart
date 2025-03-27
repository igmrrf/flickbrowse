import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/constants/api_constants.dart';
import '../../core/models/movie.dart';
import '../providers/movie_provider.dart';

class MovieListScreen extends HookConsumerWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final isSearching = useState(false);
    final scrollController = useScrollController();

    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          if (!isSearching.value) {
            ref.read(moviesProvider.notifier).loadMovies();
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child:
              isSearching.value
                  ? TextField(
                    controller: searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Search movies...',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          isSearching.value = false;
                          ref.read(searchMoviesProvider.notifier).search('');
                        },
                      ),
                    ),
                    onChanged: (query) {
                      ref.read(searchMoviesProvider.notifier).search(query);
                    },
                  )
                  : const Text('FlickBrowse'),
        ),
        actions: [
          if (!isSearching.value)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => isSearching.value = true,
            ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, '/favorites'),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final moviesState =
              isSearching.value
                  ? ref.watch(searchMoviesProvider)
                  : ref.watch(moviesProvider);

          return moviesState.when(
            data: (movies) {
              if (movies.isEmpty) {
                return Center(
                  child: Text(
                    isSearching.value
                        ? 'No movies found'
                        : 'No movies available',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }

              return GridView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieCard(
                    movie: movie,
                    onTap:
                        () => Navigator.pushNamed(
                          context,
                          '/movie-details',
                          arguments: movie,
                        ),
                  );
                },
              );
            },
            loading:
                () => GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) => const MovieCardShimmer(),
                ),
            error:
                (error, stackTrace) => Center(
                  child: Text(
                    'Error: ${error.toString()}',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.red),
                  ),
                ),
          );
        },
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  final VoidCallback? onFavoriteToggle;

  const MovieCard({
    super.key, 
    required this.movie, 
    required this.onTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child:
                      movie.posterPath != null
                          ? Image.network(
                            ApiConstants.getPosterUrl(movie.posterPath!),
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Center(child: Icon(Icons.error)),
                          )
                          : const Center(child: Icon(Icons.movie)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      if (movie.releaseDate != null)
                        Text(
                          movie.releaseDate!.substring(0, 4),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (onFavoriteToggle != null)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    movie.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MovieCardShimmer extends StatelessWidget {
  const MovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Container(color: Colors.white)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Container(height: 12, width: 40, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
