import 'package:flutter/material.dart';
import 'package:music_player/controller/playlist_provider.dart';
import 'package:music_player/model/songes.dart';
import 'package:music_player/utils/widgets/my_drawer.dart';
import 'package:music_player/view/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PlaylistProvider playlistProvider;

  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SongPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text('P L A Y L I S T')),
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          final List<Songs> playlist = value.playlist;

          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final Songs song = playlist[index];

              return ListTile(
                title: Text(
                  song.songName,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.imagePath),
                contentPadding: const EdgeInsets.all(10),
                onTap: () {
                  goToSong(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
