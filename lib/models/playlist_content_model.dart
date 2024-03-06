class PlaylistContent {
  final String id;
  final String imagePath;
  final String date;
  final double likes;
  final String description;
  final List<String> tags;

  PlaylistContent({
    required this.id,
    required this.imagePath,
    required this.date,
    required this.likes,
    required this.description,
    required this.tags,
  });

  factory PlaylistContent.fromJson(Map<String, dynamic> json) {
    return PlaylistContent(
      id: json['id'] as String? ?? '',
      imagePath: json['image_url'] as String? ?? 'default_image_path.jpg',
      date: json['date'] as String? ?? 'N/A',
      likes: (json['likes'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? 'No description',
      tags: List<String>.from(json['tags'] ?? []),
    );
  }
}