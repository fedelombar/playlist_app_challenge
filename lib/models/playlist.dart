class Playlist {
  String? title;
  String? description;
  String? thumbnailUrl;
  int? videosQuantity;
  String? time;
  bool isPrivate;
  List<String>? contentIds;

  Playlist({
    this.title,
    this.description,
    this.thumbnailUrl,
    this.isPrivate = false,
    this.contentIds,
    this.videosQuantity,
    this.time,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      title: json['title'] as String?,
      description: json['description'] as String?,
      videosQuantity: json['videosQuantity'] as int?,
      time: json['time'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      isPrivate: json['isPrivate'] ?? false,
      contentIds: List<String>.from(json['contentIds'] ?? []),
    );
  }

}
