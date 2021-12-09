import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled1/database/app_database.dart';
import 'package:untitled1/database/entities/user_detail.dart';
import 'package:untitled1/models/album.dart';
import 'package:untitled1/models/comment.dart';
import 'package:untitled1/models/photo.dart';
import 'package:untitled1/models/post.dart';

import 'package:untitled1/models/user.dart';
import 'package:untitled1/services/http_service.dart';

class UserProvider extends ChangeNotifier {
  List<User>? user;
  List<AlbumModel>? albums;
  List<Post>? posts;
  List<Photo>? photos;
  List<Comment>? comments;
  bool loading = false;
  String message = "";
  late bool error;
  List<UserDetail>? offlineUser;

  getUsers() async {
    loading = true;
    try {
      user = await HttpService().getUser();
    } catch (e) {
      message = e.toString();
    }
    loading = false;
    notifyListeners();
  }

  void updateProvider() {
    message = "";
    offlineUser = null;
    notifyListeners();
  }

  syncRemoteData(AppDatabase appDatabase) async {
    error = false;
    offlineUser = await appDatabase.loadAllUserData();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      message = "connected";
      user = await HttpService().getUser();
      if (offlineUser!.isEmpty) {
        for (int i = 0; i < user!.length; i++) {
          appDatabase.insertUser(OfflineUser(
              id: user![i].id,
              name: user![i].name,
              userName: user![i].username,
              email: user![i].email,
              street: user![i].address.street,
              suite: user![i].address.suite,
              city: user![i].address.city,
              zipCode: user![i].address.zipcode,
              lat: user![i].address.geo.lat,
              lng: user![i].address.geo.lng,
              phone: user![i].phone,
              bs: user![i].company.bs,
              catchPhrase: user![i].company.catchPhrase,
              companyName: user![i].company.name,
              website: user![i].website));
        }

        try {
          albums = await HttpService().getAlbums();
          for (int i = 0; i < albums!.length; i++) {
            appDatabase.insertAlbum(OfflineAlbum(
                title: albums![i].title,
                id: albums![i].id,
                userId: albums![i].userId));
          }
        } catch (e) {
          error = true;
          message = e.toString();
        }
        try {
          posts = await HttpService().getPosts("", false);
          for (int i = 0; i < posts!.length; i++) {
            appDatabase.insertPost(OfflinePost(
                title: posts![i].title,
                body: posts![i].body,
                userId: posts![i].userId,
                id: posts![i].id));
          }
        } catch (e) {
          error = true;
          message = e.toString();
        }

        try {
          comments = await HttpService().getComments();
          for (int i = 0; i < comments!.length; i++) {
            appDatabase.insertComment(OfflineComment(
                postId: comments![i].postId,
                id: comments![i].id,
                name: comments![i].name,
                email: comments![i].email,
                body: comments![i].body));
          }
        } catch (e) {
          error = true;
          message = e.toString();
        }
        message = "success";
        offlineUser = await appDatabase.loadAllUserData();
      }
    } else {
      if (offlineUser!.isEmpty) {
        message = "connectionNotFound";
      }
    }
    notifyListeners();
  }
}
