import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  group('MovieCard widget tests', () {
    const movie = Movie(
      id: 'spiderman-brand-new-day',
      title: 'Spider-Man: Brand New Day',
      description: 'Peter Parker faces a new threat.',
      imagePath: 'assets/images/spiderman.jpg',
      ageRating: '12A',
      screeningTime: '19:30',
      runtime: 139,
    );

    testWidgets('displays the movie details and booking button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: MovieCard(movie: movie),
            ),
          ),
        ),
      );

      expect(find.text('Spider-Man: Brand New Day'), findsOneWidget);
      expect(find.text('Peter Parker faces a new threat.'), findsOneWidget);
      expect(find.text('Age Rating: 12A'), findsOneWidget);
      expect(find.text('Screening: 19:30'), findsOneWidget);
      expect(find.text('Runtime: 139 minutes'), findsOneWidget);
      expect(find.text('Book tickets'), findsOneWidget);
    });
  });
}
