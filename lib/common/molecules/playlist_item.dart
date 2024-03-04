import 'package:flutter/material.dart';

class PlaylistItem extends StatelessWidget {
  final String title;
  final String description;
  final String thumbnailUrl;
  final bool   privacy;

  const PlaylistItem({
    Key? key,
    required this.title,
    required this.description,
    required this.privacy,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Image.network(thumbnailUrl, width: 10, height: 10), // Consider caching images in a real app
      title: Text(title),
      subtitle: Text(description),
      // onTap: Navigate or perform other actions
    );
  }
}
