class NewsModel {
  final int id;
  final String title;
  final String body;

  NewsModel({
    required this.id,
    required this.title,
    required this.body,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}