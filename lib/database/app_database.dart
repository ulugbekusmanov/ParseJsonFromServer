import 'package:moor_flutter/moor_flutter.dart';
import 'package:untitled1/database/entities/album.dart';
import 'package:untitled1/database/entities/comment.dart';
import 'package:untitled1/database/entities/photo.dart';
import 'package:untitled1/database/entities/post.dart';
import 'package:untitled1/database/entities/user.dart';
import 'package:untitled1/database/entities/user_detail.dart';

part 'app_database.g.dart';

@UseMoor(tables: [Album, Comment, Photo, Post, User])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;

  Future<List<OfflineComment>> getPostComments(int postId) async {
    List<OfflineComment> commentsList = [];
    final comments = await select(comment).get();
    for (final comment in comments) {
      if (comment.postId == postId) {
        commentsList.add(comment);
      }
    }
    return commentsList;
  }

  Future<List<OfflinePhoto>> getAlbumPhotos(int albumId) async {
    List<OfflinePhoto> photosList = [];
    final photos = await select(photo).get();
    for (final photo in photos) {
      if (photo.albumId == albumId) {
        photosList.add(photo);
      }
    }
    return photosList;
  }

  Future<List<UserDetail>> loadAllUserData() async {
    final users = await select(user).get();

    final idToUser = {
      for (final offlineUser in users)
        offlineUser.id: UserDetail(user: offlineUser, albums: [], posts: [])
    };
    final albums = await select(album).get();
    final posts = await select(post).get();
    for (final offlineAlbum in albums) {
      idToUser[offlineAlbum.userId]!.albums.add(offlineAlbum);
    }
    for (final offlinePost in posts) {
      idToUser[offlinePost.userId]!.posts.add(offlinePost);
    }
    return idToUser.values.toList();
  }

  Future deleteFromUsers() {
    return customSelect(
      "delete from user",
      readsFrom: {user},
    ).get();
  }

  Future deleteFromPosts() {
    return customSelect(
      "delete from post",
      readsFrom: {post},
    ).get();
  }

  Future deleteFromAlbums() {
    return customSelect(
      "delete from album",
      readsFrom: {album},
    ).get();
  }

  Future deleteFromPhotos() {
    return customSelect(
      "delete from photo",
      readsFrom: {album},
    ).get();
  }

  Future deleteFromComments() {
    return customSelect(
      "delete from comment",
      readsFrom: {album},
    ).get();
  }

  Future<int> insertUser(OfflineUser offlineUser) =>
      into(user).insert(offlineUser);

  Future<int> insertAlbum(OfflineAlbum offlineAlbum) =>
      into(album).insert(offlineAlbum);

  Future<int> insertComment(OfflineComment offlineComment) =>
      into(comment).insert(offlineComment);

  Future<int> insertPhoto(OfflinePhoto offlinePhoto) =>
      into(photo).insert(offlinePhoto);

  Future<int> insertPost(OfflinePost offlinePost) =>
      into(post).insert(offlinePost);

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    });
  }
}
