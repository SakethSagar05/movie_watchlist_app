import 'package:flutter/material.dart';

import '../models/movie.dart';

/// Shows a movie poster from assets, with a readable fallback if the file
/// is missing so the app never shows a red error box.
class PosterImage extends StatelessWidget {
  final Movie movie;
  final double? width;
  final double? height;
  final BoxFit fit;

  const PosterImage({
    super.key,
    required this.movie,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      movie.posterPath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Container(
        width: width,
        height: height,
        color: const Color(0xFF26284A),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Text(
          movie.title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
