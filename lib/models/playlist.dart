class Playlist {
  String? title;
  String? description;
  String? thumbnail;
  bool isPrivate;
  List<String>? contentIds;

  Playlist({
    this.title,
    this.description,
    this.thumbnail,
    this.isPrivate = false,
    this.contentIds,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      // provide default values for name, description, and thumbnail in case they are not present
      title: json['title'] as String?,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      isPrivate: json['isPrivate'] ?? false,
      contentIds: List<String>.from(json['contentIds'] ?? []),
    );
  }
}
