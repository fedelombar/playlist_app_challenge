class Playlist {
  String name;
  String description;
  String thumbnail;
  bool isPrivate;
  List<String> contentIds; // Assuming content is identified by some ID

  Playlist({
    required this.name,
    required this.description,
    required this.thumbnail,
    this.isPrivate = false,
    required this.contentIds,
  });

  // Example of a method to serialize from JSON
  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
    name: json['name'],
    description: json['description'],
    thumbnail: json['thumbnail'],
    isPrivate: json['isPrivate'],
    contentIds: List<String>.from(json['contentIds']),
  );

  // Example of a method to serialize to JSON
  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'thumbnail': thumbnail,
    'isPrivate': isPrivate,
    'contentIds': contentIds,
  };
}
