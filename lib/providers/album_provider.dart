import 'package:flutter/foundation.dart';
import 'package:untitled1/models/album.dart';
import 'package:untitled1/models/post.dart';
import 'package:untitled1/services/http_service.dart';

class AlbumProvider extends ChangeNotifier {
  List<AlbumModel>? albums;
  bool loading = false;

  void getAlbums(int userId) async {
    loading = true;
    albums = await HttpService().getAlbums();
    loading = false;
    notifyListeners();
  }
}
