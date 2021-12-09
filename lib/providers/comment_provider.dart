import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:untitled1/database/app_database.dart';
import 'package:untitled1/services/http_service.dart';

class CommentProvider extends ChangeNotifier {
  List<OfflineComment>? comments;
  bool loading = false;
  late Response response;

  void getComments(int postId, AppDatabase appDatabase) async {
    loading = true;
    comments = await appDatabase.getPostComments(postId);
    loading = false;
    notifyListeners();
  }

  Future<void> sendCommit(Map<String, dynamic> map) async {
    loading = true;
    response = await HttpService().sendComment(map);
    loading = false;
    notifyListeners();
  }
}
