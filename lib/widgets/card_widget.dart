import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String body;

  const CardWidget({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              child: Text(title),
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              child: Text(body),
            ),
          ],
        ),
      ),
    );
  }
}
