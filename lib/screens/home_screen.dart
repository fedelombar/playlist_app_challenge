import 'package:flutter/material.dart';
import 'package:playlist_app/navigators/app_navigator.dart';
import '../common/organisms/bottom_nav_bar/bottom_nav_bar.dart';
import '../controllers/playlist_controller.dart';

class HomeScreen extends StatelessWidget {
  final PlaylistController playlistController = PlaylistController();
  final AppNavigator appNavigator;

  HomeScreen({super.key,required this.appNavigator});

  void onItemTapped(int index) {
    // handle navigation or state update for the tapped item
  }

  void handleCenterTap() {
    // Logic for handling the center tap
    print("Center tapped");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: const Center(
        child: Text('Your content here'),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0, // Current index
        onItemTapped: (index) {
          // Handle item tap
        },
        onCenterItemTapped:  handleCenterTap,
        appNavigator: appNavigator,
      ),
    );
  }
}


