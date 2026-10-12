import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = MovieRepository().getMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
          style: cinemaHeaderStyle,
        ),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(
          color: cinemaBrand,
        ),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Welcome to Southsea Cinema',
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            final movie = movies[index - 1];

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: MovieCard(movie: movie),
            );
          },
        ),
      ),
    );
  }
}
