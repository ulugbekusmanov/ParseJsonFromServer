import 'package:moor_flutter/moor_flutter.dart';
@DataClassName("OfflineUser")
class User extends Table {
  IntColumn get id => integer().nullable()();
  TextColumn get name => text()();
  TextColumn get userName => text()();
  TextColumn get email => text()();
  TextColumn get street => text()();
  TextColumn get suite => text()();
  TextColumn get city => text()();
  TextColumn get zipCode => text()();
  TextColumn get lat => text()();
  TextColumn get lng => text()();
  TextColumn get phone => text()();
  TextColumn get website => text()();
  TextColumn get companyName => text()();
  TextColumn get catchPhrase => text()();
  TextColumn get bs => text()();

}
