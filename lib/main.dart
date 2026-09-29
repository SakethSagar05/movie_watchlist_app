import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(const MovieWatchlistApp());

class MovieWatchlistApp extends StatelessWidget {
  const MovieWatchlistApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFFFFB300),
      brightness: Brightness.dark,
    );
    return MaterialApp(
      title: 'Movie Watchlist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: scheme,
        scaffoldBackgroundColor: const Color(0xFF0F1020),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F1020),
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
