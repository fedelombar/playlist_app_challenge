import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            IconButton(
              icon: const Icon(IconlyLight.more_circle, color: Colors.white),
              onPressed: () {
                // Actions when the menu is tapped
              },
            ),
          ],
        ),
      ),
    );
  }
}
