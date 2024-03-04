import '../models/playlist.dart';

class PlaylistController {
  List<Playlist> playlists = [];

  void createPlaylist(Playlist playlist) {
    playlists.add(playlist);
  }

// Add more functionalities as needed, such as edit, delete, etc.
}
