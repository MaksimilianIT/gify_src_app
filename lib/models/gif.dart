class Gif {
  final String id;
  final String title;
  final String url;

  Gif({
    required this.id,
    required this.title,
    required this.url,
  });

  factory Gif.fromJson(Map<String, dynamic> json) {
    return Gif(
      id: json['id'],
      title: json['title'] ?? 'No title', // Fallback if missing
      url: json['images']['fixed_height']['url'],
    );
  }
}
