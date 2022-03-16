import 'package:flutter/material.dart';

class UpdateForum extends StatefulWidget {
  static const String routeName = '/update_posts';

  const UpdateForum({Key? key}) : super(key: key);

  @override
  State<UpdateForum> createState() => _UpdateForumState();
}

class _UpdateForumState extends State<UpdateForum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Update Post"),
    ));
  }
}
