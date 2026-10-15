import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'spiderman-brand-new-day',
        title: 'Spider-Man: Brand New Day',
        description:
            'Peter Parker faces a new threat while trying to protect New York.',
        imagePath: 'assets/images/spiderman.jpg',
        ageRating: '12A',
        screeningTime: '19:30',
        runtime: 139,
      ),
      Movie(
        id: 'avengers-doomsday',
        title: 'Avengers: Doomsday',
        description: 'The Avengers unite to face a powerful new threat.',
        imagePath: 'assets/images/avengers.jpg',
        ageRating: '12A',
        screeningTime: '20:00',
        runtime: 150,
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }

    return null;
  }
}
