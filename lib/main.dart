import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/providers/album_provider.dart';
import 'package:untitled1/providers/comment_provider.dart';
import 'package:untitled1/providers/photo_provider.dart';
import 'package:untitled1/providers/post_provider.dart';
import 'package:untitled1/providers/user_provider.dart';
import 'package:untitled1/screens/dashboard_screen.dart';

import 'database/app_database.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          Provider(create: (context) => AppDatabase()),

          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => PhotoProvider()),
          ChangeNotifierProvider(create: (_) => CommentProvider()),
          ChangeNotifierProvider(create: (_) => PostProvider()),
          ChangeNotifierProvider(create: (_) => AlbumProvider()),

        ],
        child: const MyApp(),
      ));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eclipse Digital Studio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
    );
  }
}
