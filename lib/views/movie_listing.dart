import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int selectedQuantity = 1;
  bool addedToOrder = false;

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
            DropdownMenu<int>(
              initialSelection: 1,
              label: const Text('Tickets'),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5'),
              ],
              onSelected: (value) {
                setState(() {
                  selectedQuantity = value ?? 1;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  addedToOrder = true;
                });
              },
              child: Text(
                addedToOrder ? 'Added to order!' : 'Add to order',
              ),
            ),
          ],
        ),
      ),
    );
  }
}