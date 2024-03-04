import 'package:flutter/material.dart';

import '../atoms/image_atom.dart';
import '../atoms/text_atom.dart';

class PlaylistCardMolecule extends StatelessWidget {
  final String title;
  final String description;
  final String thumbnailUrl;


  const PlaylistCardMolecule({
    Key? key,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ImageAtom(thumbnailUrl: thumbnailUrl),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextAtom(text: title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  TextAtom(text: description, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
