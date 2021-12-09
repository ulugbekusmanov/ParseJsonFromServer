import 'package:moor_flutter/moor_flutter.dart';
@DataClassName("OfflineComment")
class Comment extends Table {
  IntColumn get id => integer().nullable()();
  IntColumn get postId => integer().nullable()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get body => text()();

}