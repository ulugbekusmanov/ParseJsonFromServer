import 'package:flutter/material.dart';
import 'package:untitled1/database/app_database.dart';
import 'package:untitled1/screens/photos_detail_screen.dart';

class AlbumsListScreen extends StatefulWidget {
  final List<OfflineAlbum> albums;

  const AlbumsListScreen({Key? key, required this.albums}) : super(key: key);

  @override
  _AlbumsListScreenState createState() => _AlbumsListScreenState();
}

class _AlbumsListScreenState extends State<AlbumsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Albums List"),
      ),
      body: Container(
        padding: const EdgeInsets.all(6.0),
        child: ListView.builder(
            itemCount: widget.albums.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhotosListScreen(
                          albumId: widget.albums[index].id!,
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
                          child: Text(widget.albums[index].title),
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
