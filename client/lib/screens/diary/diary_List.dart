import 'package:client/Components/my_blog_slides.dart';
import 'package:flutter/material.dart';

import '../../Providers/diary_item_provider.dart';
import '../../models/diary_model.dart';

class MyDiaries extends StatefulWidget {
  static const String routeName = '/my_diary';
  const MyDiaries({Key? key}) : super(key: key);

  @override
  State<MyDiaries> createState() => _MyDiariesState();
}



Widget diaryList(posts) {
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
            return MyBlogSlidesComponent(model: posts[index]);
          },
        )
      ],
    ),
  );
}

Widget loadDiaries() {

  var userId = DiaryItemProvider.uid;

  return FutureBuilder(
    // future: Service.getFlowers(),
      future: DiaryItemProvider().getUserDiaryPosts(userId),
      builder: (
          BuildContext context,
          AsyncSnapshot<List<DiaryItem>?> model,
          ) {
        if (model.hasData) {
          return diaryList(model.data);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
}

class _MyDiariesState extends State<MyDiaries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Posts")),
      body: loadDiaries(),
    );
  }
}
