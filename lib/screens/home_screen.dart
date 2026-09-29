import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../widgets/movie_tile.dart';
import 'details_screen.dart';
import 'watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Push a screen, then rebuild when we come back so bookmark icons and the
  // watchlist counter reflect any changes made on the other screen.
  Future<void> _open(Widget screen) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final watchlistCount = sampleMovies.where((m) => m.isWatchlisted).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie Watchlist',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 96),
        itemCount: sampleMovies.length,
        itemBuilder: (context, index) {
          final movie = sampleMovies[index];
          return MovieTile(
            movie: movie,
            onTap: () => _open(DetailsScreen(movie: movie)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _open(const WatchlistScreen()),
        icon: const Icon(Icons.bookmarks),
        label: Text('View Watchlist ($watchlistCount)'),
      ),
    );
  }
}
