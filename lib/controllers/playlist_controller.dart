import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> saveOrder(List<int> itemOrder) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> orderAsString = itemOrder.map((i) => i.toString()).toList();
    await prefs.setStringList('savedOrder', orderAsString);
  }

  Future<List<int>> loadOrder() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> orderAsString = prefs.getStringList('savedOrder') ?? [];
    return orderAsString.map((i) => int.parse(i)).toList();
  }
}


