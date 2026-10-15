import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  const movie = Movie(
    id: 'spiderman-brand-new-day',
    title: 'Spider-Man: Brand New Day',
    description: 'Peter Parker faces a new threat.',
    imagePath: 'assets/images/spiderman.jpg',
    ageRating: '12A',
    screeningTime: '19:30',
    runtime: 139,
  );

  Future<void> openMovieListing(WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1;

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: MovieListing(movie: movie),
      ),
    );
  }

  testWidgets(
    'MovieListing displays the selected movie',
    (WidgetTester tester) async {
      await openMovieListing(tester);

      expect(find.text('Spider-Man: Brand New Day'), findsWidgets);
      expect(find.text('Screening: 19:30'), findsOneWidget);
      expect(find.text('Add to order'), findsOneWidget);
    },
  );

  testWidgets(
    'Ticket dropdown offers quantities from 1 to 5',
    (WidgetTester tester) async {
      await openMovieListing(tester);

      await tester.tap(find.byType(DropdownMenu<int>));
      await tester.pumpAndSettle();

      for (var quantity = 1; quantity <= 5; quantity++) {
        expect(find.text('$quantity'), findsWidgets);
      }
    },
  );

  testWidgets(
    'Selecting 5 tickets updates the dropdown',
    (WidgetTester tester) async {
      await openMovieListing(tester);

      await tester.tap(find.byType(DropdownMenu<int>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('5').last);
      await tester.pumpAndSettle();

      expect(find.text('5'), findsWidgets);
    },
  );
}
