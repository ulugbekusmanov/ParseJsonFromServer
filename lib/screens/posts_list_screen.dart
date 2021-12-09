import 'package:flutter/material.dart';
import 'package:untitled1/database/app_database.dart';
import 'package:untitled1/models/post.dart';

import 'comment_detail_screen.dart';

class PostsListScreen extends StatefulWidget {
  final List<OfflinePost> posts;
  final int userId;

  const PostsListScreen({Key? key, required this.posts,required this.userId}) : super(key: key);

  @override
  _PostsListScreenState createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts List"),
      ),
      body:  Container(
        padding: const EdgeInsets.all(6.0),
        child: ListView.builder(
            itemCount: widget.posts.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommentDetailScreen(
                          postId:
                          widget.posts[index].id!,
                          userId: widget.userId,
                        )),
                  );
                },
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6.0),
                          child:
                          Text(widget.posts[index].title),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            widget.posts[index].body,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
