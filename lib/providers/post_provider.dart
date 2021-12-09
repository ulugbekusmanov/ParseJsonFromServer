import 'package:flutter/foundation.dart';
import 'package:untitled1/models/post.dart';
import 'package:untitled1/services/http_service.dart';

class PostProvider extends ChangeNotifier {
  List<Post>? post;

  bool loading = false;
  void getPosts(int userId) async{
    loading = true;
    post = await HttpService().getPosts(userId.toString(), true);
    loading = false;
    notifyListeners();
  }
}
