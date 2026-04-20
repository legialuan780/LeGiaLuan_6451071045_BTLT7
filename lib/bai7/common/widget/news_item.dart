import 'package:flutter/material.dart';
import '../../data/models/news_model.dart';
import '../style/app_text_style.dart';

class NewsItem extends StatelessWidget {
  final NewsModel news;

  const NewsItem({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: AppTextStyle.title,
            ),
            const SizedBox(height: 8),
            Text(
              news.body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.body,
            ),
          ],
        ),
      ),
    );
  }
}