import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/database/app_database.dart';
import 'package:untitled1/models/user.dart';
import 'package:untitled1/providers/user_provider.dart';
import 'package:untitled1/widgets/user_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late AppDatabase appDatabase;
  late UserProvider provider;

  @override
  void initState() {
    appDatabase = Provider.of<AppDatabase>(context, listen: false);
    provider = Provider.of<UserProvider>(context, listen: false);
    provider.syncRemoteData(appDatabase);
    super.initState();
  }

  Future<void> handleClick(String value) async {
    switch (value) {
      case 'Update Data':
        await appDatabase.deleteFromUsers();
        await appDatabase.deleteFromPosts();
        await appDatabase.deleteFromAlbums();
        await appDatabase.deleteFromComments();
        await appDatabase.deleteFromPhotos();
        provider.updateProvider();
        await provider.syncRemoteData(appDatabase);
        if (provider.message == "success") {
          Fluttertoast.showToast(
              msg: "Data Updated",
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {
                  'Update Data',
                }.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          title: const Text("Eclipse Digital"),
        ),
        body: Consumer<UserProvider>(
          builder: (context, data, child) {
            if (data.offlineUser != null && data.offlineUser!.isNotEmpty) {
              return UserListWidget(users: data.offlineUser!);
            } else if (data.message == "connectionNotFound") {
              return Center(
                  child: Column(
                children: [
                  const Text(
                      "No Internet. check your cellular data connection"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextButton(
                    onPressed: () async {
                      provider.updateProvider();
                      await provider.syncRemoteData(appDatabase);
                    },
                    child: const Text('Repeat'),
                  )
                ],
              ));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
