import 'package:flutter/material.dart';

// Image Atom
class ImageAtomContentCard extends StatelessWidget {
  final String imagePath;

  const ImageAtomContentCard({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );
  }
}

// Icon Text Atom
class IconTextAtomContentCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconTextAtomContentCard({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}

//Tag
class TagTextAtomContentCard extends StatelessWidget {
  final String text;

  const TagTextAtomContentCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.blue),
    );
  }
}
