import 'package:flutter/material.dart';

class ContentCardOrganism extends StatelessWidget {
  final String imagePath;
  final String date;
  final double likes;
  final String description;
  final List<String> tags;

  const ContentCardOrganism({
    super.key,
    required this.imagePath,
    required this.date,
    required this.likes,
    required this.description,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    // Concatenate tags into a single string
    final tagsString = tags.join(' ');

    return Column(
      children: [
        Container(
          height: 225,
          width: 166,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 8,
                right: 8,
                child: Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red, size: 16),
                    SizedBox(width: 4),
                    Text(
                      '${likes.toStringAsFixed(1)}K',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  date,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            description,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            tagsString,
            style: TextStyle(color: Colors.white.withOpacity(0.7)),
          ),
        ),
      ],
    );
  }
}
