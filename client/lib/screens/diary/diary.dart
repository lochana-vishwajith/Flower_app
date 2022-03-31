import 'package:client/Components/blog_component.dart';
import 'package:client/Providers/diary_item_provider.dart';
import 'package:client/models/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/diary/diary_Add.dart';
import 'package:client/screens/diary/diary_List.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  @override
  void initState() {
    super.initState();
  }

  Widget DiaryList(posts) {
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
              return BlogComponent(
                model: posts[index],
              );
            },
          )
        ],
      ),
    );
  }

  Widget loadDiaries() {
    return FutureBuilder(
      // future: Service.getFlowers(),
        future: DiaryItemProvider().getAllDiaryPosts(),
        builder: (
            BuildContext context,
            AsyncSnapshot<List<DiaryItem>?> model,
            ) {
          if (model.hasData) {
            return DiaryList(model.data);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(padding: const EdgeInsets.all(2), child: loadDiaries()),
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
                    tooltip: 'Create Blog Diary',
                    child: const Icon(Icons.add)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 30,
                    width: 100,
                    child: FloatingActionButton(
                        onPressed: () {
                         Navigator.of(context).pushNamed( MyDiaries.routeName);
                        },
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15))),
                        backgroundColor: const Color.fromARGB(255, 50, 59, 190),
                        splashColor: const Color.fromARGB(255, 116, 114, 214),
                        hoverColor: const Color.fromARGB(255, 6, 24, 58),
                        foregroundColor:
                        const Color.fromARGB(255, 255, 255, 255),
                        elevation: 12,
                        tooltip: 'My Posts',
                        child: const Center(child: Text("My Diary Blogs"))),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
