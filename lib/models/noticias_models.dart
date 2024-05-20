class Article {
  final String title;
  final String description;
  final String url;
  final String imageUrl;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imageUrl: json['image'] as String? ?? '',
    );
  }
}