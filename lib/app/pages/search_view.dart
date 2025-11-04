import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  static final List<Map<String, dynamic>> genres = [
    {'name': 'Pop', 'icon': Icons.music_note},
    {'name': 'Rock', 'icon': Icons.music_note},
    {'name': 'Jazz', 'icon': Icons.piano},
    {'name': 'Classical', 'icon': Icons.music_note},
    {'name': 'Hip Hop', 'icon': Icons.mic},
    {'name': 'Electronic', 'icon': Icons.electric_bolt},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search songs, artists, or albums',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Browse All',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return _buildGenreCard(
                  genres[index]['name'],
                  genres[index]['icon'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenreCard(String name, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.primaries[name.length % Colors.primaries.length],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              icon,
              size: 100,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
