import 'package:flutter/cupertino.dart';

class ImageAtom extends StatelessWidget {
  final String thumbnailUrl;
  final double width;
  final double height;
  final BoxFit fit;

  const ImageAtom({
    Key? key,
    required this.thumbnailUrl,
    this.width = 40.0,
    this.height = 40.0,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(thumbnailUrl,
        width: width,
        height: height,
        fit: fit),
    );
  }
}
