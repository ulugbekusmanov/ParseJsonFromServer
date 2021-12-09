import 'package:untitled1/database/app_database.dart';

class UserDetail {
  final OfflineUser user;
  final List<OfflineAlbum> albums;
  final List<OfflinePost> posts;

  UserDetail({required this.user, required this.albums, required this.posts});
}
