class ContentCardItem {
  final int id;
  final String title;
  final String imageUrl;
  final String thumbnailUrl;
  // final int likes;
  // final DateTime date;

  ContentCardItem({required this.id, required this.title, required this.imageUrl, required this.thumbnailUrl});

  factory ContentCardItem.fromJson(Map<String, dynamic> json) {
    return ContentCardItem(
      id: json['id'],
      title: json['title'],
      imageUrl: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
