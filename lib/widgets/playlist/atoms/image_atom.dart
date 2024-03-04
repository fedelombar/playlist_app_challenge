import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageAtom extends StatelessWidget {
  final String thumbnailUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const ImageAtom({
    Key? key,
    required this.thumbnailUrl,
    this.width = 20.0,
    this.height = 20.0,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        thumbnailUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          // Specify your error image asset or network path here
          return const Icon(Icons.error); // Placeholder for an error
        },
      ),
    );
  }
}
