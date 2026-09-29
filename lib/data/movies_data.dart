import '../models/movie.dart';

// Double-quoted strings so apostrophes inside synopses don't break the code.
final List<Movie> sampleMovies = [
  Movie(
    title: "Inception",
    posterPath: "assets/images/inception.jpg",
    year: 2010,
    genre: "Sci-Fi Thriller",
    cast: ["Leonardo DiCaprio", "Joseph Gordon-Levitt", "Elliot Page", "Tom Hardy"],
    synopsis:
        "A skilled thief who steals secrets from inside people's dreams is offered a chance to erase his criminal past, if he can plant an idea in a target's mind instead.",
  ),
  Movie(
    title: "The Matrix",
    posterPath: "assets/images/matrix.jpg",
    year: 1999,
    genre: "Sci-Fi Action",
    cast: ["Keanu Reeves", "Laurence Fishburne", "Carrie-Anne Moss", "Hugo Weaving"],
    synopsis:
        "A hacker discovers that everyday reality is a simulation built by machines, and joins a band of rebels fighting to free humanity.",
  ),
  Movie(
    title: "Interstellar",
    posterPath: "assets/images/interstellar.jpg",
    year: 2014,
    genre: "Sci-Fi Drama",
    cast: ["Matthew McConaughey", "Anne Hathaway", "Jessica Chastain", "Michael Caine"],
    synopsis:
        "With Earth's crops failing, a former pilot leads a crew through a wormhole in search of a new home for humanity.",
  ),
  Movie(
    title: "The Dark Knight",
    posterPath: "assets/images/dark_knight.jpg",
    year: 2008,
    genre: "Action Crime",
    cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart", "Gary Oldman"],
    synopsis:
        "Batman faces the Joker, an anarchic criminal mastermind who pushes Gotham City and its defenders to their moral limits.",
  ),
  Movie(
    title: "Parasite",
    posterPath: "assets/images/parasite.jpg",
    year: 2019,
    genre: "Thriller Drama",
    cast: ["Song Kang-ho", "Choi Woo-shik", "Park So-dam", "Lee Sun-kyun"],
    synopsis:
        "A struggling family schemes its way into the lives of a wealthy household, setting off events no one could have predicted.",
  ),
];
