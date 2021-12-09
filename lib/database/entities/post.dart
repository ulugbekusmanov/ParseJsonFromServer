import 'package:moor_flutter/moor_flutter.dart';
@DataClassName("OfflinePost")
class Post extends Table {
  IntColumn get id => integer().nullable()();
  IntColumn get userId => integer().nullable()();
  TextColumn get title => text()();
  TextColumn get body => text()();

}