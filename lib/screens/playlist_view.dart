import 'package:flutter/material.dart';
import 'package:playlist_app/widgets/playlist_view/organisms/custom_app_bar_play_view.dart';
import '../../../models/playlist.dart';
import '../../../navigators/app_navigator.dart';
import '../../../common/organisms/bottom_nav_bar/bottom_nav_bar.dart';

class PlaylistView extends StatelessWidget {
  final Playlist playlist;
  final AppNavigator appNavigator;

  const PlaylistView({Key? key, required this.playlist, required this.appNavigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBarPlaylistView(playlist: playlist),
          ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
        onItemTapped: (index) {
        },
        onCenterItemTapped: () {
        },
        appNavigator: appNavigator,
      ),
    );
  }
}
