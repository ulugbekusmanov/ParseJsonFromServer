import 'package:moor_flutter/moor_flutter.dart';
@DataClassName("OfflineAlbum")
class Album extends Table {
  IntColumn get id => integer().nullable()();
  IntColumn get userId => integer().nullable()();
  TextColumn get title => text()();

}