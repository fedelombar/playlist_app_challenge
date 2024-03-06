import 'package:flutter/material.dart';

class ContentCardOrganism extends StatelessWidget {
  final String imagePath;
  final String date;
  final String likes;
  final List<String> tags;

  const ContentCardOrganism({
    super.key,
    required this.imagePath,
    required this.date,
    required this.likes,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 273,
      width: 166,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            height: 225,
            width: 166,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.favorite, color: Colors.white, size: 12),
                            const SizedBox(width: 5),
                            Text(
                              likes.toString(),
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    // Optionally display tags here if needed
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
