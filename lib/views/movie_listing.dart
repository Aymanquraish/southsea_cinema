import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        child: Column(
          children: [
            const Text(
              'Spider-Man: Brand New Day',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              'Peter Parker faces a new threat while trying to protect New York City as Spider-Man.',
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Runtime: 135 minutes'),
                Text('Age Rating: 12A'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}