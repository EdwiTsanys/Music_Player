import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaylistDetailView extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {'title': 'Song 1', 'artist': 'Artist 1', 'duration': '3:45'},
    {'title': 'Song 2', 'artist': 'Artist 2', 'duration': '4:20'},
    {'title': 'Song 3', 'artist': 'Artist 3', 'duration': '3:15'},
    {'title': 'Song 4', 'artist': 'Artist 4', 'duration': '3:30'},
    {'title': 'Song 5', 'artist': 'Artist 5', 'duration': '4:10'},
  ];

  PlaylistDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('My Favorite Playlist'),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.purple, Colors.black],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.music_note,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Created by User',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '15 songs • 1 hour 2 minutes',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.shuffle),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.play_arrow),
                        label: Text('Play'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final song = songs[index];
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.music_note, color: Colors.white, size: 20),
                  ),
                  title: Text(song['title']!),
                  subtitle: Text(song['artist']!),
                  trailing: Text(song['duration']!),
                  onTap: () => Get.toNamed('/now-playing'),
                );
              },
              childCount: songs.length,
            ),
          ),
        ],
      ),
    );
  }
}
