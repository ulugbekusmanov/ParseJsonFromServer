import 'package:moor_flutter/moor_flutter.dart';
@DataClassName("OfflinePhoto")
class Photo extends Table {
  IntColumn get id => integer().nullable()();
  IntColumn get albumId =>  integer().nullable()();
  TextColumn get title => text()();
  TextColumn get url => text()();
  TextColumn get thumbnailUrl => text()();

}