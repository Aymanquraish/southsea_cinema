import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie with the given properties', () {
      const movie = Movie(
        id: 'spiderman-brand-new-day',
        title: 'Spider-Man: Brand New Day',
        description: 'Peter Parker faces a new threat.',
        imagePath: 'assets/images/spiderman.jpg',
        ageRating: '12A',
        screeningTime: '19:30',
        runtime: 139,
      );

      expect(movie.id, 'spiderman-brand-new-day');
      expect(movie.title, 'Spider-Man: Brand New Day');
      expect(movie.description, 'Peter Parker faces a new threat.');
      expect(movie.imagePath, 'assets/images/spiderman.jpg');
      expect(movie.ageRating, '12A');
      expect(movie.screeningTime, '19:30');
      expect(movie.runtime, 139);
    });
  });
}
