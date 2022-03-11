import 'package:client/models/forum_items.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  // final ForumItem item;
  final String title;
  const CardComponent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(title),
          )
        ],
      ),
    );
  }
}
