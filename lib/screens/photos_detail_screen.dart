import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/database/app_database.dart';
import 'package:untitled1/providers/photo_provider.dart';

class PhotosListScreen extends StatefulWidget {
  final int albumId;

  const PhotosListScreen({Key? key, required this.albumId}) : super(key: key);

  @override
  _PhotosListScreenState createState() => _PhotosListScreenState();
}

class _PhotosListScreenState extends State<PhotosListScreen> {
  late AppDatabase appDatabase;

  @override
  void initState() {
    appDatabase = Provider.of<AppDatabase>(context, listen: false);
    Provider.of<PhotoProvider>(context, listen: false)
        .getAlbumPhotos(widget.albumId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Photos"),
        ),
        body: Consumer<PhotoProvider>(builder: (context, data, child) {
          if (data.photos != null && data.photos!.isNotEmpty) {
            return GridView.builder(
              itemCount: data.photos!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  data.photos![index].url,
                  fit: BoxFit.cover,
                );
              },
            );
          } else if (data.error) {
            return Center(
              child: Text(data.message),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
