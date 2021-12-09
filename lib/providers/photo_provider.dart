import 'package:flutter/foundation.dart';
import 'package:untitled1/database/app_database.dart';
import 'package:untitled1/models/photo.dart';
import 'package:untitled1/services/http_service.dart';

class PhotoProvider extends ChangeNotifier {
  List<Photo>? photos;
  bool loading = false;
  String message = "";
  late bool error;

  void getAlbumPhotos(String albumId) async {
    error = false;
    loading = true;
    try {
      photos = await HttpService().getPhotos(albumId);
    } catch (e) {
      error = true;
      message = e.toString();
    }
    loading = false;
    notifyListeners();
  }
}
