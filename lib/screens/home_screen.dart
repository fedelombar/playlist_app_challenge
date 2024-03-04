import 'package:flutter/material.dart';
import '../common/organisms/playlist/playlist_list.dart';
import '../models/playlist.dart';
import '../navigators/app_navigator.dart';
import '../common/organisms/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:playlist_app/services/playlist_service.dart';

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
    var fetchedPlaylists = await PlaylistService.loadPlaylists(); // Load playlists from a service
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
      body: PlaylistList(playlists: playlists), // Display the dynamic list of playlists
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        onItemTapped: (index) {
          // Handle item tap
        },
        onCenterItemTapped: () {
          // Here, you could open a modal to create a new playlist
          // For demonstration, let's simulate adding a new playlist
          // _addPlaylist(Playlist(
          //   name: 'New Playlist ${playlists.length}',
          //   description: 'Description for Playlist ${playlists.length}',
          //   thumbnail: 'https://example.com/thumbnail.jpg',
          //   isPrivate: false,
          //   contentIds: ['1', '2', '3'],
          //   title: 'Title',
          // ));
        },
        appNavigator: widget.appNavigator,
      ),
    );
  }
}
