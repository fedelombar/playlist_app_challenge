import 'dart:ui';
import 'package:flutter/material.dart';

// ImageAtom with purple overlay and optional blur effect
class ImageAppBarAtom extends StatelessWidget {
  final String thumbnailUrl;
  final bool applyBlur;
  const ImageAppBarAtom({Key? key, required this.thumbnailUrl, this.applyBlur = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      thumbnailUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );

    // If applyBlur is true, wrap the image with a BackdropFilter
    if (applyBlur) {
      image = BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: image,
      );
    }

    return Stack(
      fit: StackFit.expand, // Ensure the stack fills the space
      children: [
        image, // The actual image
        // Gradient overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black12.withOpacity(0.8), Colors.deepPurple.withOpacity(0.2)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
