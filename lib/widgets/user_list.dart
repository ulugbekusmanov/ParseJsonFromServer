import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/database/entities/user_detail.dart';
import 'package:untitled1/models/user.dart';
import 'package:untitled1/screens/detail_screen.dart';
import 'package:untitled1/widgets/card_widget.dart';

class UserListWidget extends StatelessWidget {
  final List<UserDetail> users;

  const UserListWidget({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(
                          user: users[index],
                        )),
              );
            },
            child: CardWidget(
              body: users[index].user.name,
              title: users[index].user.userName,
            ),
          );
        });
  }
}
