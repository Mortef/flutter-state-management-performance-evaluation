import 'package:data_fetch_watchit/api/models/post.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final leading = CircleAvatar(child: Text(post.id.toString()));
    final title = Text(post.title);
    final subtitle = Text(post.body);
    return ListTile(leading: leading, title: title, subtitle: subtitle);
  }
}
