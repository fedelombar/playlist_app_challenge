import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/playlist.dart';
import '../models/playlist_content_model.dart';

class PlaylistController {
  List<Playlist> playlists = [];

  void createPlaylist(Playlist playlist) {
    playlists.add(playlist);
  }
}

class PlaylistService {
  static Future<List<Playlist>> loadPlaylists() async {
    final String response =
        await rootBundle.loadString('assets/data/playlists.json');
    final List<dynamic> data = json.decode(response);
    return data.map<Playlist>((json) => Playlist.fromJson(json)).toList();
  }
}

class PlaylistContentController {
  Future<List<PlaylistContent>> loadPlaylistContent() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/playlist_content.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((data) => PlaylistContent.fromJson(data)).toList();
  }
}
