import 'package:flutter/material.dart';

import '../models/movie.dart';
import 'poster_image.dart';

/// Card used by both HomeScreen and WatchlistScreen.
class MovieTile extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  final Widget? trailing;

  const MovieTile({
    super.key,
    required this.movie,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: const Color(0xFF1A1C36),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Hero(
                tag: 'poster-${movie.title}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: PosterImage(movie: movie, width: 72, height: 104),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${movie.year}  •  ${movie.genre}',
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.white60),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.cast.take(2).join(', '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              trailing ??
                  Icon(
                    movie.isWatchlisted
                        ? Icons.bookmark
                        : Icons.chevron_right,
                    color: movie.isWatchlisted ? Colors.amber : Colors.white38,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
