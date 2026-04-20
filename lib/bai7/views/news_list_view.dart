import 'package:flutter/material.dart';
import '../common/widget/news_item.dart';
import '../controllers/news_controller.dart';
import '../data/models/news_model.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  final NewsController _controller = NewsController();

  bool _isLoading = true;
  List<NewsModel> _newsList = [];

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  Future<void> _loadNews() async {
    try {
      final data = await _controller.getNews();

      setState(() {
        _newsList = data.take(15).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi tải dữ liệu: $e'),
        ),
      );
    }
  }

  Future<void> _refreshNews() async {
    try {
      final data = await _controller.getNews();

      setState(() {
        _newsList = data.take(15).toList();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Dữ liệu đã được làm mới'),
          duration: Duration(seconds: 1),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi refresh: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin tức 6451071045'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : RefreshIndicator(
        onRefresh: _refreshNews,
        child: _newsList.isEmpty
            ? ListView(
          children: const [
            SizedBox(height: 250),
            Center(
              child: Text('Không có dữ liệu'),
            ),
          ],
        )
            : ListView.builder(
          itemCount: _newsList.length,
          itemBuilder: (context, index) {
            return NewsItem(news: _newsList[index]);
          },
        ),
      ),
    );
  }
}