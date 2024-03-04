import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../models/playlist.dart';

class PlaylistService {
  static Future<List<Playlist>> loadPlaylists() async {
    final String response = await rootBundle.loadString('assets/data/playlists.json');
    final List<dynamic> data = json.decode(response);
    // Assuming you have a Playlist model with a fromJson constructor
    return data.map<Playlist>((json) => Playlist.fromJson(json)).toList();
  }
}
