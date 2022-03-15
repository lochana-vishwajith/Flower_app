import 'package:client/Components/my_posts_card.dart';
import 'package:flutter/material.dart';

import '../../Providers/forum_Item_provider..dart';
import '../../models/forum_items.dart';

class MyPosts extends StatefulWidget {
  static const String routeName = '/my_posts';
  const MyPosts({Key? key}) : super(key: key);

  @override
  State<MyPosts> createState() => _MyPostsState();
}

Widget forumList(posts) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return MyPostCardComponent(model: posts[index]);
          },
        )
      ],
    ),
  );
}

Widget loadPosts() {
  const String userId = '1';

  return FutureBuilder(
      // future: Service.getFlowers(),
      future: ForumItemProvider().getUserForumPosts(userId),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ForumItem>?> model,
      ) {
        if (model.hasData) {
          return forumList(model.data);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Posts")),
      body: loadPosts(),
    );
  }
}
