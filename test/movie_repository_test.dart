import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository tests', () {
    final repository = MovieRepository();

    test('returns two movies', () {
      final movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('returns Spider-Man and Avengers', () {
      final movies = repository.getMovies();

      expect(movies[0].title, 'Spider-Man: Brand New Day');
      expect(movies[1].title, 'Avengers: Doomsday');
    });

    test('finds a movie by its ID', () {
      final movie = repository.getMovieById('avengers-doomsday');

      expect(movie, isNotNull);
      expect(movie!.title, 'Avengers: Doomsday');
    });

    test('returns null for an unknown movie ID', () {
      final Movie? movie = repository.getMovieById('unknown-movie');

      expect(movie, isNull);
    });
  });
}
