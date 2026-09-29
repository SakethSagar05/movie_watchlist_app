import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../widgets/movie_tile.dart';
import 'details_screen.dart';

// Graduate feature: lists only the movies marked as watchlisted.
class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    final watchlist = sampleMovies.where((m) => m.isWatchlisted).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Watchlist',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: watchlist.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.bookmark_border, size: 64, color: Colors.white38),
                  SizedBox(height: 12),
                  Text(
                    'Your watchlist is empty',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Open a movie and tap the bookmark to save it.',
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              itemCount: watchlist.length,
              itemBuilder: (context, index) {
                final movie = watchlist[index];
                return MovieTile(
                  movie: movie,
                  trailing: IconButton(
                    tooltip: 'Remove from watchlist',
                    icon: const Icon(Icons.bookmark_remove, color: Colors.amber),
                    onPressed: () =>
                        setState(() => movie.isWatchlisted = false),
                  ),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(movie: movie),
                      ),
                    );
                    if (mounted) setState(() {});
                  },
                );
              },
            ),
    );
  }
}
