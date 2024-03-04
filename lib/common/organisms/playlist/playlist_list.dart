import 'package:flutter/material.dart';
import '../../../models/playlist.dart';
import '../../../navigators/app_navigator.dart';
import '../../../screens/playlist_view.dart';
import '../../../widgets/playlist/molecules/playlist_card_molecule.dart';

class PlaylistList extends StatelessWidget {
  final List<Playlist> playlists;
  final AppNavigator appNavigator;

  const PlaylistList({
    Key? key,
    required this.playlists,
    required this.appNavigator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        final playlist = playlists[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PlaylistView(playlist: playlist, appNavigator: appNavigator),
              ),
            );
          },
          child: PlaylistCardMolecule(
            title: playlist.title ?? 'Untitled Playlist',
            description: playlist.description ?? 'No description',
            thumbnailUrl: playlist.thumbnail ?? '',
            // privacy: playlist.isPrivate,
          ),
        );
      },
    );
  }
}
