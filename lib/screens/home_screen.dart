import 'package:flutter/material.dart';
import '../common/organisms/playlist/playlist_list.dart';
import '../controllers/playlist_controller.dart';
import '../models/playlist.dart';
import '../navigators/app_navigator.dart';
import '../common/organisms/bottom_nav_bar/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  final AppNavigator appNavigator;

  HomeScreen({Key? key, required this.appNavigator}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Playlist> playlists = []; // Initially empty, will be populated dynamically

  @override
  void initState() {
    super.initState();
    // Simulate loading playlists
    _loadPlaylists();
  }

  void _loadPlaylists() async {
    // Simulate fetching playlists
    // This could be replaced with a real fetch from a database or network call
    var fetchedPlaylists =
        await PlaylistService.loadPlaylists(); // Load playlists from a service
    setState(() {
      playlists = fetchedPlaylists;
    });
  }

  //
  // void _addPlaylist(Playlist newPlaylist) {
  //   setState(() {
  //     playlists.add(newPlaylist);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Playlists'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PlaylistList(
              playlists: playlists,
              appNavigator: widget.appNavigator,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        onItemTapped: (index) {},
        onCenterItemTapped: () {},
        appNavigator: widget.appNavigator,
      ),
    );
  }
}