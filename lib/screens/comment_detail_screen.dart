import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/database/app_database.dart';
import 'package:untitled1/providers/comment_provider.dart';
import 'package:untitled1/providers/post_provider.dart';

class CommentDetailScreen extends StatefulWidget {
  final int postId;
  final int userId;

  const CommentDetailScreen(
      {Key? key, required this.postId, required this.userId})
      : super(key: key);

  @override
  _CommentDetailScreenState createState() => _CommentDetailScreenState();
}

class _CommentDetailScreenState extends State<CommentDetailScreen> {
  late CommentProvider provider;
  late AppDatabase appDatabase;
  late TextEditingController emailController;
  late TextEditingController titleController;
  late TextEditingController bodyController;

  @override
  void dispose() {
    emailController.dispose();
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    emailController = TextEditingController();
    titleController = TextEditingController();
    bodyController = TextEditingController();
    appDatabase = Provider.of<AppDatabase>(context, listen: false);
    provider = Provider.of<CommentProvider>(context, listen: false);
    provider.getComments(widget.postId, appDatabase);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: Consumer<CommentProvider>(builder: (context, data, child) {
        if (data.comments != null && data.comments!.isNotEmpty) {
          return Container(
            padding: const EdgeInsets.all(6.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        child: Text("Name: ${data.comments![index].name}"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        child: Text("Body: ${data.comments![index].body}"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        child: Text("Email: ${data.comments![index].email}"),
                      ),
                    ],
                  ),
                ));
              },
              itemCount: data.comments!.length,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 400,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        child: TextField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        child: TextField(
                          controller: bodyController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Body',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6.0),
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text('Send'),
                          onPressed: () async {
                            Map<String, dynamic> map = {
                              "title": titleController.text,
                              "body": bodyController.text,
                              "userId": widget.userId
                            };
                            await provider.sendCommit(map);
                            if (provider.response != null &&
                                provider.response.statusCode == 201) {
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: "Data Uploaded",
                                  toastLength: Toast.LENGTH_SHORT,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
