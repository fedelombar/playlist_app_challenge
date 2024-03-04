import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:playlist_app/navigators/app_navigator.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final VoidCallback? onCenterItemTapped;
  final AppNavigator appNavigator;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.onCenterItemTapped, // Now nullable
    required this.appNavigator,
  }) : super(key: key);


  Widget _buildIcon(IconData iconData, bool isSelected) {
    return Icon(
      iconData,
      color: isSelected ? Colors.white : Colors.grey,
      size: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    final fabButton = Container(
      width: 56, // Standard FAB size
      height: 56,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.purple],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: const Icon(Icons.add, color: Colors.white, size: 30,),
    );
    return SafeArea( child:Container(
      height: 72,
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Color.fromARGB(240, 43, 43, 43),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: _buildIcon(IconlyBold.home, selectedIndex == 0),
            onPressed: () => onItemTapped(0),
          ),
          IconButton(
            icon: _buildIcon(IconlyBold.play, selectedIndex == 1),
            onPressed: () => onItemTapped(1),
          ),
          InkWell(
            onTap: onCenterItemTapped, //InkWell for tap detection
            child: fabButton,
          ),
          IconButton(
            icon: _buildIcon(IconlyBold.chat, selectedIndex == 2),
            onPressed: () => onItemTapped(2),
          ),
          IconButton(
            icon: _buildIcon(IconlyBold.profile, selectedIndex == 3),
            onPressed: () => onItemTapped(3),
          ),
        ],
      ),
    ),
    );
  }
}


