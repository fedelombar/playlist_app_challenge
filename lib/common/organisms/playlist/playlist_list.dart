import 'package:flutter/material.dart';
import '../../../models/playlist.dart';
import '../../../widgets/playlist/molecules/playlist_card_molecule.dart';
import '../../molecules/playlist_item.dart';

class PlaylistList extends StatelessWidget {
  final List<Playlist> playlists;

  const PlaylistList({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        final playlist = playlists[index];
        return PlaylistCardMolecule(
          title: playlist.title ?? 'Untitled Playlist',
          description: playlist.description ?? 'No description',
          thumbnailUrl: playlist.thumbnail ?? '',
          // privacy: playlist.isPrivate,
        );
      },
    );
  }
}

