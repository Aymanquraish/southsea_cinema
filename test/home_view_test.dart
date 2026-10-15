import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/home_view.dart';

void main() {
  group('HomeView widget tests', () {
    testWidgets('displays the welcome message and both movies',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeView(),
        ),
      );

      expect(find.text('Welcome to Southsea Cinema'), findsOneWidget);
      expect(find.text('Spider-Man: Brand New Day'), findsOneWidget);
      expect(find.text('Avengers: Doomsday'), findsOneWidget);
      expect(find.text('Book tickets'), findsNWidgets(2));
    });
  });
}
