// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class OfflineAlbum extends DataClass implements Insertable<OfflineAlbum> {
  final int? id;
  final int? userId;
  final String title;
  OfflineAlbum({this.id, this.userId, required this.title});
  factory OfflineAlbum.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return OfflineAlbum(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int?>(userId);
    }
    map['title'] = Variable<String>(title);
    return map;
  }

  AlbumCompanion toCompanion(bool nullToAbsent) {
    return AlbumCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      title: Value(title),
    );
  }

  factory OfflineAlbum.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OfflineAlbum(
      id: serializer.fromJson<int?>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'userId': serializer.toJson<int?>(userId),
      'title': serializer.toJson<String>(title),
    };
  }

  OfflineAlbum copyWith({int? id, int? userId, String? title}) => OfflineAlbum(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('OfflineAlbum(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflineAlbum &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title);
}

class AlbumCompanion extends UpdateCompanion<OfflineAlbum> {
  final Value<int?> id;
  final Value<int?> userId;
  final Value<String> title;
  const AlbumCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
  });
  AlbumCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<OfflineAlbum> custom({
    Expression<int?>? id,
    Expression<int?>? userId,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
    });
  }

  AlbumCompanion copyWith(
      {Value<int?>? id, Value<int?>? userId, Value<String>? title}) {
    return AlbumCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int?>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AlbumCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $AlbumTable extends Album with TableInfo<$AlbumTable, OfflineAlbum> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AlbumTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, title];
  @override
  String get aliasedName => _alias ?? 'album';
  @override
  String get actualTableName => 'album';
  @override
  VerificationContext validateIntegrity(Insertable<OfflineAlbum> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  OfflineAlbum map(Map<String, dynamic> data, {String? tablePrefix}) {
    return OfflineAlbum.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AlbumTable createAlias(String alias) {
    return $AlbumTable(_db, alias);
  }
}

class OfflineComment extends DataClass implements Insertable<OfflineComment> {
  final int? id;
  final int? postId;
  final String name;
  final String email;
  final String body;
  OfflineComment(
      {this.id,
      this.postId,
      required this.name,
      required this.email,
      required this.body});
  factory OfflineComment.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return OfflineComment(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      postId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}post_id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || postId != null) {
      map['post_id'] = Variable<int?>(postId);
    }
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['body'] = Variable<String>(body);
    return map;
  }

  CommentCompanion toCompanion(bool nullToAbsent) {
    return CommentCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      postId:
          postId == null && nullToAbsent ? const Value.absent() : Value(postId),
      name: Value(name),
      email: Value(email),
      body: Value(body),
    );
  }

  factory OfflineComment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OfflineComment(
      id: serializer.fromJson<int?>(json['id']),
      postId: serializer.fromJson<int?>(json['postId']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'postId': serializer.toJson<int?>(postId),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'body': serializer.toJson<String>(body),
    };
  }

  OfflineComment copyWith(
          {int? id, int? postId, String? name, String? email, String? body}) =>
      OfflineComment(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        name: name ?? this.name,
        email: email ?? this.email,
        body: body ?? this.body,
      );
  @override
  String toString() {
    return (StringBuffer('OfflineComment(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, postId, name, email, body);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflineComment &&
          other.id == this.id &&
          other.postId == this.postId &&
          other.name == this.name &&
          other.email == this.email &&
          other.body == this.body);
}

class CommentCompanion extends UpdateCompanion<OfflineComment> {
  final Value<int?> id;
  final Value<int?> postId;
  final Value<String> name;
  final Value<String> email;
  final Value<String> body;
  const CommentCompanion({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.body = const Value.absent(),
  });
  CommentCompanion.insert({
    this.id = const Value.absent(),
    this.postId = const Value.absent(),
    required String name,
    required String email,
    required String body,
  })  : name = Value(name),
        email = Value(email),
        body = Value(body);
  static Insertable<OfflineComment> custom({
    Expression<int?>? id,
    Expression<int?>? postId,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? body,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (postId != null) 'post_id': postId,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (body != null) 'body': body,
    });
  }

  CommentCompanion copyWith(
      {Value<int?>? id,
      Value<int?>? postId,
      Value<String>? name,
      Value<String>? email,
      Value<String>? body}) {
    return CommentCompanion(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (postId.present) {
      map['post_id'] = Variable<int?>(postId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentCompanion(')
          ..write('id: $id, ')
          ..write('postId: $postId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }
}

class $CommentTable extends Comment
    with TableInfo<$CommentTable, OfflineComment> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CommentTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _postIdMeta = const VerificationMeta('postId');
  late final GeneratedColumn<int?> postId = GeneratedColumn<int?>(
      'post_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<String?> body = GeneratedColumn<String?>(
      'body', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, postId, name, email, body];
  @override
  String get aliasedName => _alias ?? 'comment';
  @override
  String get actualTableName => 'comment';
  @override
  VerificationContext validateIntegrity(Insertable<OfflineComment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('post_id')) {
      context.handle(_postIdMeta,
          postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  OfflineComment map(Map<String, dynamic> data, {String? tablePrefix}) {
    return OfflineComment.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CommentTable createAlias(String alias) {
    return $CommentTable(_db, alias);
  }
}

class OfflinePhoto extends DataClass implements Insertable<OfflinePhoto> {
  final int? id;
  final int? albumId;
  final String title;
  final String url;
  final String thumbnailUrl;
  OfflinePhoto(
      {this.id,
      this.albumId,
      required this.title,
      required this.url,
      required this.thumbnailUrl});
  factory OfflinePhoto.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return OfflinePhoto(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      albumId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}album_id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      thumbnailUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail_url'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || albumId != null) {
      map['album_id'] = Variable<int?>(albumId);
    }
    map['title'] = Variable<String>(title);
    map['url'] = Variable<String>(url);
    map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    return map;
  }

  PhotoCompanion toCompanion(bool nullToAbsent) {
    return PhotoCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      albumId: albumId == null && nullToAbsent
          ? const Value.absent()
          : Value(albumId),
      title: Value(title),
      url: Value(url),
      thumbnailUrl: Value(thumbnailUrl),
    );
  }

  factory OfflinePhoto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OfflinePhoto(
      id: serializer.fromJson<int?>(json['id']),
      albumId: serializer.fromJson<int?>(json['albumId']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      thumbnailUrl: serializer.fromJson<String>(json['thumbnailUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'albumId': serializer.toJson<int?>(albumId),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'thumbnailUrl': serializer.toJson<String>(thumbnailUrl),
    };
  }

  OfflinePhoto copyWith(
          {int? id,
          int? albumId,
          String? title,
          String? url,
          String? thumbnailUrl}) =>
      OfflinePhoto(
        id: id ?? this.id,
        albumId: albumId ?? this.albumId,
        title: title ?? this.title,
        url: url ?? this.url,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );
  @override
  String toString() {
    return (StringBuffer('OfflinePhoto(')
          ..write('id: $id, ')
          ..write('albumId: $albumId, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('thumbnailUrl: $thumbnailUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, albumId, title, url, thumbnailUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflinePhoto &&
          other.id == this.id &&
          other.albumId == this.albumId &&
          other.title == this.title &&
          other.url == this.url &&
          other.thumbnailUrl == this.thumbnailUrl);
}

class PhotoCompanion extends UpdateCompanion<OfflinePhoto> {
  final Value<int?> id;
  final Value<int?> albumId;
  final Value<String> title;
  final Value<String> url;
  final Value<String> thumbnailUrl;
  const PhotoCompanion({
    this.id = const Value.absent(),
    this.albumId = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
  });
  PhotoCompanion.insert({
    this.id = const Value.absent(),
    this.albumId = const Value.absent(),
    required String title,
    required String url,
    required String thumbnailUrl,
  })  : title = Value(title),
        url = Value(url),
        thumbnailUrl = Value(thumbnailUrl);
  static Insertable<OfflinePhoto> custom({
    Expression<int?>? id,
    Expression<int?>? albumId,
    Expression<String>? title,
    Expression<String>? url,
    Expression<String>? thumbnailUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (albumId != null) 'album_id': albumId,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
    });
  }

  PhotoCompanion copyWith(
      {Value<int?>? id,
      Value<int?>? albumId,
      Value<String>? title,
      Value<String>? url,
      Value<String>? thumbnailUrl}) {
    return PhotoCompanion(
      id: id ?? this.id,
      albumId: albumId ?? this.albumId,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (albumId.present) {
      map['album_id'] = Variable<int?>(albumId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotoCompanion(')
          ..write('id: $id, ')
          ..write('albumId: $albumId, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('thumbnailUrl: $thumbnailUrl')
          ..write(')'))
        .toString();
  }
}

class $PhotoTable extends Photo with TableInfo<$PhotoTable, OfflinePhoto> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PhotoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _albumIdMeta = const VerificationMeta('albumId');
  late final GeneratedColumn<int?> albumId = GeneratedColumn<int?>(
      'album_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  late final GeneratedColumn<String?> thumbnailUrl = GeneratedColumn<String?>(
      'thumbnail_url', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, albumId, title, url, thumbnailUrl];
  @override
  String get aliasedName => _alias ?? 'photo';
  @override
  String get actualTableName => 'photo';
  @override
  VerificationContext validateIntegrity(Insertable<OfflinePhoto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('album_id')) {
      context.handle(_albumIdMeta,
          albumId.isAcceptableOrUnknown(data['album_id']!, _albumIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableOrUnknown(
              data['thumbnail_url']!, _thumbnailUrlMeta));
    } else if (isInserting) {
      context.missing(_thumbnailUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  OfflinePhoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    return OfflinePhoto.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PhotoTable createAlias(String alias) {
    return $PhotoTable(_db, alias);
  }
}

class OfflinePost extends DataClass implements Insertable<OfflinePost> {
  final int? id;
  final int? userId;
  final String title;
  final String body;
  OfflinePost({this.id, this.userId, required this.title, required this.body});
  factory OfflinePost.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return OfflinePost(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int?>(userId);
    }
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    return map;
  }

  PostCompanion toCompanion(bool nullToAbsent) {
    return PostCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      title: Value(title),
      body: Value(body),
    );
  }

  factory OfflinePost.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OfflinePost(
      id: serializer.fromJson<int?>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'userId': serializer.toJson<int?>(userId),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
    };
  }

  OfflinePost copyWith({int? id, int? userId, String? title, String? body}) =>
      OfflinePost(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        body: body ?? this.body,
      );
  @override
  String toString() {
    return (StringBuffer('OfflinePost(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, title, body);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflinePost &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.body == this.body);
}

class PostCompanion extends UpdateCompanion<OfflinePost> {
  final Value<int?> id;
  final Value<int?> userId;
  final Value<String> title;
  final Value<String> body;
  const PostCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
  });
  PostCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    required String title,
    required String body,
  })  : title = Value(title),
        body = Value(body);
  static Insertable<OfflinePost> custom({
    Expression<int?>? id,
    Expression<int?>? userId,
    Expression<String>? title,
    Expression<String>? body,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
    });
  }

  PostCompanion copyWith(
      {Value<int?>? id,
      Value<int?>? userId,
      Value<String>? title,
      Value<String>? body}) {
    return PostCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int?>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }
}

class $PostTable extends Post with TableInfo<$PostTable, OfflinePost> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PostTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<String?> body = GeneratedColumn<String?>(
      'body', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, title, body];
  @override
  String get aliasedName => _alias ?? 'post';
  @override
  String get actualTableName => 'post';
  @override
  VerificationContext validateIntegrity(Insertable<OfflinePost> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  OfflinePost map(Map<String, dynamic> data, {String? tablePrefix}) {
    return OfflinePost.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PostTable createAlias(String alias) {
    return $PostTable(_db, alias);
  }
}

class OfflineUser extends DataClass implements Insertable<OfflineUser> {
  final int? id;
  final String name;
  final String userName;
  final String email;
  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final String lat;
  final String lng;
  final String phone;
  final String website;
  final String companyName;
  final String catchPhrase;
  final String bs;
  OfflineUser(
      {this.id,
      required this.name,
      required this.userName,
      required this.email,
      required this.street,
      required this.suite,
      required this.city,
      required this.zipCode,
      required this.lat,
      required this.lng,
      required this.phone,
      required this.website,
      required this.companyName,
      required this.catchPhrase,
      required this.bs});
  factory OfflineUser.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return OfflineUser(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      userName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      street: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}street'])!,
      suite: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}suite'])!,
      city: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city'])!,
      zipCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}zip_code'])!,
      lat: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lat'])!,
      lng: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lng'])!,
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone'])!,
      website: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}website'])!,
      companyName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}company_name'])!,
      catchPhrase: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}catch_phrase'])!,
      bs: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bs'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['name'] = Variable<String>(name);
    map['user_name'] = Variable<String>(userName);
    map['email'] = Variable<String>(email);
    map['street'] = Variable<String>(street);
    map['suite'] = Variable<String>(suite);
    map['city'] = Variable<String>(city);
    map['zip_code'] = Variable<String>(zipCode);
    map['lat'] = Variable<String>(lat);
    map['lng'] = Variable<String>(lng);
    map['phone'] = Variable<String>(phone);
    map['website'] = Variable<String>(website);
    map['company_name'] = Variable<String>(companyName);
    map['catch_phrase'] = Variable<String>(catchPhrase);
    map['bs'] = Variable<String>(bs);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      userName: Value(userName),
      email: Value(email),
      street: Value(street),
      suite: Value(suite),
      city: Value(city),
      zipCode: Value(zipCode),
      lat: Value(lat),
      lng: Value(lng),
      phone: Value(phone),
      website: Value(website),
      companyName: Value(companyName),
      catchPhrase: Value(catchPhrase),
      bs: Value(bs),
    );
  }

  factory OfflineUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return OfflineUser(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userName: serializer.fromJson<String>(json['userName']),
      email: serializer.fromJson<String>(json['email']),
      street: serializer.fromJson<String>(json['street']),
      suite: serializer.fromJson<String>(json['suite']),
      city: serializer.fromJson<String>(json['city']),
      zipCode: serializer.fromJson<String>(json['zipCode']),
      lat: serializer.fromJson<String>(json['lat']),
      lng: serializer.fromJson<String>(json['lng']),
      phone: serializer.fromJson<String>(json['phone']),
      website: serializer.fromJson<String>(json['website']),
      companyName: serializer.fromJson<String>(json['companyName']),
      catchPhrase: serializer.fromJson<String>(json['catchPhrase']),
      bs: serializer.fromJson<String>(json['bs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String>(name),
      'userName': serializer.toJson<String>(userName),
      'email': serializer.toJson<String>(email),
      'street': serializer.toJson<String>(street),
      'suite': serializer.toJson<String>(suite),
      'city': serializer.toJson<String>(city),
      'zipCode': serializer.toJson<String>(zipCode),
      'lat': serializer.toJson<String>(lat),
      'lng': serializer.toJson<String>(lng),
      'phone': serializer.toJson<String>(phone),
      'website': serializer.toJson<String>(website),
      'companyName': serializer.toJson<String>(companyName),
      'catchPhrase': serializer.toJson<String>(catchPhrase),
      'bs': serializer.toJson<String>(bs),
    };
  }

  OfflineUser copyWith(
          {int? id,
          String? name,
          String? userName,
          String? email,
          String? street,
          String? suite,
          String? city,
          String? zipCode,
          String? lat,
          String? lng,
          String? phone,
          String? website,
          String? companyName,
          String? catchPhrase,
          String? bs}) =>
      OfflineUser(
        id: id ?? this.id,
        name: name ?? this.name,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        street: street ?? this.street,
        suite: suite ?? this.suite,
        city: city ?? this.city,
        zipCode: zipCode ?? this.zipCode,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        phone: phone ?? this.phone,
        website: website ?? this.website,
        companyName: companyName ?? this.companyName,
        catchPhrase: catchPhrase ?? this.catchPhrase,
        bs: bs ?? this.bs,
      );
  @override
  String toString() {
    return (StringBuffer('OfflineUser(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('street: $street, ')
          ..write('suite: $suite, ')
          ..write('city: $city, ')
          ..write('zipCode: $zipCode, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('phone: $phone, ')
          ..write('website: $website, ')
          ..write('companyName: $companyName, ')
          ..write('catchPhrase: $catchPhrase, ')
          ..write('bs: $bs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, userName, email, street, suite,
      city, zipCode, lat, lng, phone, website, companyName, catchPhrase, bs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfflineUser &&
          other.id == this.id &&
          other.name == this.name &&
          other.userName == this.userName &&
          other.email == this.email &&
          other.street == this.street &&
          other.suite == this.suite &&
          other.city == this.city &&
          other.zipCode == this.zipCode &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.phone == this.phone &&
          other.website == this.website &&
          other.companyName == this.companyName &&
          other.catchPhrase == this.catchPhrase &&
          other.bs == this.bs);
}

class UserCompanion extends UpdateCompanion<OfflineUser> {
  final Value<int?> id;
  final Value<String> name;
  final Value<String> userName;
  final Value<String> email;
  final Value<String> street;
  final Value<String> suite;
  final Value<String> city;
  final Value<String> zipCode;
  final Value<String> lat;
  final Value<String> lng;
  final Value<String> phone;
  final Value<String> website;
  final Value<String> companyName;
  final Value<String> catchPhrase;
  final Value<String> bs;
  const UserCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userName = const Value.absent(),
    this.email = const Value.absent(),
    this.street = const Value.absent(),
    this.suite = const Value.absent(),
    this.city = const Value.absent(),
    this.zipCode = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.phone = const Value.absent(),
    this.website = const Value.absent(),
    this.companyName = const Value.absent(),
    this.catchPhrase = const Value.absent(),
    this.bs = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String userName,
    required String email,
    required String street,
    required String suite,
    required String city,
    required String zipCode,
    required String lat,
    required String lng,
    required String phone,
    required String website,
    required String companyName,
    required String catchPhrase,
    required String bs,
  })  : name = Value(name),
        userName = Value(userName),
        email = Value(email),
        street = Value(street),
        suite = Value(suite),
        city = Value(city),
        zipCode = Value(zipCode),
        lat = Value(lat),
        lng = Value(lng),
        phone = Value(phone),
        website = Value(website),
        companyName = Value(companyName),
        catchPhrase = Value(catchPhrase),
        bs = Value(bs);
  static Insertable<OfflineUser> custom({
    Expression<int?>? id,
    Expression<String>? name,
    Expression<String>? userName,
    Expression<String>? email,
    Expression<String>? street,
    Expression<String>? suite,
    Expression<String>? city,
    Expression<String>? zipCode,
    Expression<String>? lat,
    Expression<String>? lng,
    Expression<String>? phone,
    Expression<String>? website,
    Expression<String>? companyName,
    Expression<String>? catchPhrase,
    Expression<String>? bs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userName != null) 'user_name': userName,
      if (email != null) 'email': email,
      if (street != null) 'street': street,
      if (suite != null) 'suite': suite,
      if (city != null) 'city': city,
      if (zipCode != null) 'zip_code': zipCode,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (phone != null) 'phone': phone,
      if (website != null) 'website': website,
      if (companyName != null) 'company_name': companyName,
      if (catchPhrase != null) 'catch_phrase': catchPhrase,
      if (bs != null) 'bs': bs,
    });
  }

  UserCompanion copyWith(
      {Value<int?>? id,
      Value<String>? name,
      Value<String>? userName,
      Value<String>? email,
      Value<String>? street,
      Value<String>? suite,
      Value<String>? city,
      Value<String>? zipCode,
      Value<String>? lat,
      Value<String>? lng,
      Value<String>? phone,
      Value<String>? website,
      Value<String>? companyName,
      Value<String>? catchPhrase,
      Value<String>? bs}) {
    return UserCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      companyName: companyName ?? this.companyName,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (suite.present) {
      map['suite'] = Variable<String>(suite.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (zipCode.present) {
      map['zip_code'] = Variable<String>(zipCode.value);
    }
    if (lat.present) {
      map['lat'] = Variable<String>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<String>(lng.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (catchPhrase.present) {
      map['catch_phrase'] = Variable<String>(catchPhrase.value);
    }
    if (bs.present) {
      map['bs'] = Variable<String>(bs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('street: $street, ')
          ..write('suite: $suite, ')
          ..write('city: $city, ')
          ..write('zipCode: $zipCode, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('phone: $phone, ')
          ..write('website: $website, ')
          ..write('companyName: $companyName, ')
          ..write('catchPhrase: $catchPhrase, ')
          ..write('bs: $bs')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, OfflineUser> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UserTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  late final GeneratedColumn<String?> userName = GeneratedColumn<String?>(
      'user_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _streetMeta = const VerificationMeta('street');
  late final GeneratedColumn<String?> street = GeneratedColumn<String?>(
      'street', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _suiteMeta = const VerificationMeta('suite');
  late final GeneratedColumn<String?> suite = GeneratedColumn<String?>(
      'suite', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _cityMeta = const VerificationMeta('city');
  late final GeneratedColumn<String?> city = GeneratedColumn<String?>(
      'city', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _zipCodeMeta = const VerificationMeta('zipCode');
  late final GeneratedColumn<String?> zipCode = GeneratedColumn<String?>(
      'zip_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _latMeta = const VerificationMeta('lat');
  late final GeneratedColumn<String?> lat = GeneratedColumn<String?>(
      'lat', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _lngMeta = const VerificationMeta('lng');
  late final GeneratedColumn<String?> lng = GeneratedColumn<String?>(
      'lng', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _websiteMeta = const VerificationMeta('website');
  late final GeneratedColumn<String?> website = GeneratedColumn<String?>(
      'website', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  late final GeneratedColumn<String?> companyName = GeneratedColumn<String?>(
      'company_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _catchPhraseMeta =
      const VerificationMeta('catchPhrase');
  late final GeneratedColumn<String?> catchPhrase = GeneratedColumn<String?>(
      'catch_phrase', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _bsMeta = const VerificationMeta('bs');
  late final GeneratedColumn<String?> bs = GeneratedColumn<String?>(
      'bs', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        userName,
        email,
        street,
        suite,
        city,
        zipCode,
        lat,
        lng,
        phone,
        website,
        companyName,
        catchPhrase,
        bs
      ];
  @override
  String get aliasedName => _alias ?? 'user';
  @override
  String get actualTableName => 'user';
  @override
  VerificationContext validateIntegrity(Insertable<OfflineUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    } else if (isInserting) {
      context.missing(_streetMeta);
    }
    if (data.containsKey('suite')) {
      context.handle(
          _suiteMeta, suite.isAcceptableOrUnknown(data['suite']!, _suiteMeta));
    } else if (isInserting) {
      context.missing(_suiteMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('zip_code')) {
      context.handle(_zipCodeMeta,
          zipCode.isAcceptableOrUnknown(data['zip_code']!, _zipCodeMeta));
    } else if (isInserting) {
      context.missing(_zipCodeMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    } else if (isInserting) {
      context.missing(_websiteMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('catch_phrase')) {
      context.handle(
          _catchPhraseMeta,
          catchPhrase.isAcceptableOrUnknown(
              data['catch_phrase']!, _catchPhraseMeta));
    } else if (isInserting) {
      context.missing(_catchPhraseMeta);
    }
    if (data.containsKey('bs')) {
      context.handle(_bsMeta, bs.isAcceptableOrUnknown(data['bs']!, _bsMeta));
    } else if (isInserting) {
      context.missing(_bsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  OfflineUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    return OfflineUser.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AlbumTable album = $AlbumTable(this);
  late final $CommentTable comment = $CommentTable(this);
  late final $PhotoTable photo = $PhotoTable(this);
  late final $PostTable post = $PostTable(this);
  late final $UserTable user = $UserTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [album, comment, photo, post, user];
}
