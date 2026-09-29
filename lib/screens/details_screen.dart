import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../widgets/poster_image.dart';

// StatefulWidget because the watchlist toggle changes what is on screen.
class DetailsScreen extends StatefulWidget {
  final Movie movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  void _toggleWatchlist() {
    setState(() {
      widget.movie.isWatchlisted = !widget.movie.isWatchlisted;
    });
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(widget.movie.isWatchlisted
            ? 'Added to your watchlist'
            : 'Removed from your watchlist'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        actions: [
          IconButton(
            tooltip: movie.isWatchlisted
                ? 'Remove from watchlist'
                : 'Add to watchlist',
            icon: Icon(
              movie.isWatchlisted ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.amber,
            ),
            onPressed: _toggleWatchlist,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'poster-${movie.title}',
              child: PosterImage(
                movie: movie,
                height: 340,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${movie.year}  •  ${movie.genre}',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: 24),
                  Text('Cast', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final name in movie.cast) Chip(label: Text(name)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text('Synopsis', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    movie.synopsis,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _toggleWatchlist,
                      icon: Icon(movie.isWatchlisted
                          ? Icons.bookmark_remove
                          : Icons.bookmark_add),
                      label: Text(movie.isWatchlisted
                          ? 'Remove from Watchlist'
                          : 'Add to Watchlist'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
