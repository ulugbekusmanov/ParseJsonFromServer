import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/database/entities/user_detail.dart';
import 'package:untitled1/models/user.dart';
import 'package:untitled1/providers/album_provider.dart';
import 'package:untitled1/providers/post_provider.dart';
import 'package:untitled1/screens/albums_list_screen.dart';
import 'package:untitled1/screens/comment_detail_screen.dart';
import 'package:untitled1/screens/photos_detail_screen.dart';
import 'package:untitled1/screens/posts_list_screen.dart';
import 'package:untitled1/widgets/card_widget.dart';

class DetailScreen extends StatefulWidget {
  final UserDetail user;

  const DetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.user.user.userName),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  "User detail",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6.0),
                child: Card(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.user.user.name),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.user.user.email),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.user.user.phone),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.user.user.website),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.user.user.name),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.user.user.bs),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.user.user.catchPhrase),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  "Posts",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CommentDetailScreen(
                                            postId:
                                                widget.user.posts[index].id!,
                                            userId: widget.user.user.id!,
                                          )),
                                );
                              },
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                            widget.user.posts[index].title),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                          widget.user.posts[index].body,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostsListScreen(
                                  userId: widget.user.user.id!,
                                      posts: widget.user.posts,
                                    )),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: const Align(
                            child: Text("See all"),
                            alignment: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  "Albums",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PhotosListScreen(
                                            albumId:
                                                widget.user.albums[index].id!,
                                          )),
                                );
                              },
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(
                                            widget.user.albums[index].title),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AlbumsListScreen(
                                      albums: widget.user.albums,
                                    )),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          child: const Align(
                            child: Text("See all"),
                            alignment: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
