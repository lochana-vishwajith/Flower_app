import 'package:client/Components/my_blog_slides.dart';
import 'package:flutter/material.dart';
import '../../Providers/diary_item_provider.dart';
import '../../models/diary_model.dart';
import 'diary_Add.dart';


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
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(4),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(CreateDiary.routeName);
                    },
                    backgroundColor: const Color.fromARGB(255, 50, 59, 190),
                    splashColor: const Color.fromARGB(255, 116, 114, 214),
                    hoverColor: const Color.fromARGB(255, 6, 24, 58),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 12,
                    tooltip: 'Add a new Blog Post ',
                    child: const Icon(Icons.add)),
              ),
            ],
          ),
        )
    );
  }
}
