import 'package:flutter/material.dart';
import '../common/style/app_text_style.dart';
import '../common/widget/custom_text_field.dart';
import '../controllers/post_controller.dart';
import '../data/models/post_model.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final PostController _controller = PostController();

  bool _isLoading = false;
  String _message = '';
  PostModel? _responsePost;

  Future<void> _createPost() async {
    final title = _titleController.text.trim();
    final body = _bodyController.text.trim();

    if (title.isEmpty || body.isEmpty) {
      setState(() {
        _message = 'Vui lòng nhập đầy đủ tiêu đề và nội dung';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _message = '';
      _responsePost = null;
    });

    try {
      final result = await _controller.createPost(title, body);

      setState(() {
        _responsePost = result;
        _message = 'Post created successfully';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Post created successfully'),
        ),
      );
    } catch (e) {
      setState(() {
        _message = 'Lỗi: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo bài viết'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create Post',
              style: AppTextStyle.title,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _titleController,
              label: 'Nhập tiêu đề',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _bodyController,
              label: 'Nhập nội dung',
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _createPost,
                child: _isLoading
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : const Text('Tạo bài viết'),
              ),
            ),
            const SizedBox(height: 20),
            if (_message.isNotEmpty)
              Text(
                _message,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            const SizedBox(height: 16),
            if (_responsePost != null) ...[
              const Text(
                'Response từ server:',
                style: AppTextStyle.label,
              ),
              const SizedBox(height: 8),
              Text(
                'ID: ${_responsePost!.id}\n'
                    'Title: ${_responsePost!.title}\n'
                    'Body: ${_responsePost!.body}\n'
                    'User ID: ${_responsePost!.userId}',
                style: AppTextStyle.response,
              ),
            ],
          ],
        ),
      ),
    );
  }
}