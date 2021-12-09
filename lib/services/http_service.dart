import 'dart:convert';

import 'package:untitled1/constants.dart';
import 'package:untitled1/models/album.dart';
import 'package:untitled1/models/comment.dart';
import 'package:untitled1/models/photo.dart';
import 'package:untitled1/models/post.dart';
import 'package:untitled1/models/user.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<List<User>> getUser() async {
    final response = await http.get(Uri.https(
      Constants.baseUrl,
      Constants.getUsers,
    ));
    if (response.statusCode == 200) {
      return parseUser(response.body);
    } else {
      throw 'Unable load data';
    }
  }

  Future<List<Comment>> getComments() async {
    final response = await http.get(Uri.https(
      Constants.baseUrl,
      Constants.getComments,
    )).timeout(const Duration(seconds: 10), onTimeout: () {
      throw Exception("Time out");
    });
    if (response.statusCode == 200) {
      return parseComments(response.body);
    } else {
      throw 'Unable load data';
    }
  }

  Future<http.Response> sendComment(Map<String, dynamic> data) {
    return http
        .post(Uri.https(Constants.baseUrl, Constants.getPosts),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode(data))
        .timeout(const Duration(seconds: 10), onTimeout: () {
      throw Exception("Time out");
    });
  }

  Future<List<Post>> getPosts(String userId, bool withUserId) async {
    final response = await http.get(withUserId
        ? Uri.https(Constants.baseUrl, Constants.getPosts, {"userId": userId})
        : Uri.https(Constants.baseUrl, Constants.getPosts)).timeout(const Duration(seconds: 10), onTimeout: () {
      throw Exception("Time out");
    });
    if (response.statusCode == 200) {
      return parsePost(response.body);
    } else {
      throw 'Unable load data';
    }
  }

  Future<List<AlbumModel>> getAlbums() async {
    final response =
        await http.get(Uri.https(Constants.baseUrl, Constants.getAlbums)).timeout(const Duration(seconds: 10), onTimeout: () {
          throw Exception("Time out");
        });
    if (response.statusCode == 200) {
      return parseAlbum(response.body);
    } else {
      throw 'Unable load data';
    }
  }

  Future<List<Photo>> getPhotos(String albumId) async {
    final response = await http
        .get(Uri.https(Constants.baseUrl, "${Constants.getAlbums}/$albumId${Constants.getPhotos}")).timeout(const Duration(seconds: 10), onTimeout: () {
      throw Exception("Time out");
    });

    if (response.statusCode == 200) {
      return parsePhoto(response.body);
    } else {
      throw 'Unable load data';
    }
  }

  List<User> parseUser(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  List<Post> parsePost(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  List<AlbumModel> parseAlbum(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<AlbumModel>((json) => AlbumModel.fromJson(json)).toList();
  }

  List<Photo> parsePhoto(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  List<Comment> parseComments(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
  }
}
