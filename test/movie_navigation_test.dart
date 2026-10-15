import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  group('Movie navigation tests', () {
    const movie = Movie(
      id: 'spiderman-brand-new-day',
      title: 'Spider-Man: Brand New Day',
      description: 'Peter Parker faces a new threat.',
      imagePath: 'assets/images/spiderman.jpg',
      ageRating: '12A',
      screeningTime: '19:30',
      runtime: 139,
    );

    testWidgets(
      'Book tickets opens the selected movie listing',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1;

        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: MovieCard(movie: movie),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Book tickets'));
        await tester.pumpAndSettle();

        expect(find.byType(MovieListing), findsOneWidget);
        expect(find.text('Screening: 19:30'), findsOneWidget);
        expect(find.text('Add to order'), findsOneWidget);
      },
    );
  });
}
