import 'package:client/Components/card_component.dart';
import 'package:client/Providers/forum_Item_provider..dart';
import 'package:client/models/forum_items.dart';
import 'package:client/screens/forum/my_posts.dart';
import 'package:client/screens/forum/start_conversation.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  void initState() {
    super.initState();
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
              return CardComponent(
                model: posts[index],
              );
            },
          )
        ],
      ),
    );
  }

  Widget loadPosts() {
    return FutureBuilder(
        // future: Service.getFlowers(),
        future: ForumItemProvider().getAllForumPosts(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(padding: const EdgeInsets.all(2), child: loadPosts()),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(4),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(StartConversation.routeName);
                    },
                    backgroundColor: const Color.fromARGB(255, 50, 59, 190),
                    splashColor: const Color.fromARGB(255, 116, 114, 214),
                    hoverColor: const Color.fromARGB(255, 6, 24, 58),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 12,
                    tooltip: 'Start Coversation',
                    child: const Icon(Icons.add)),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 20),
              //   child: Align(
              //     alignment: Alignment.topRight,
              //     child: Container(
              //       height: 30,
              //       width: 100,
              //       child: FloatingActionButton(
              //           onPressed: () {
              //             Navigator.of(context).pushNamed(MyPosts.routeName);
              //           },
              //           shape: const RoundedRectangleBorder(
              //               borderRadius:
              //                   BorderRadius.all(Radius.circular(15))),
              //           backgroundColor: const Color.fromARGB(255, 50, 59, 190),
              //           splashColor: const Color.fromARGB(255, 116, 114, 214),
              //           hoverColor: const Color.fromARGB(255, 6, 24, 58),
              //           foregroundColor:
              //               const Color.fromARGB(255, 255, 255, 255),
              //           elevation: 12,
              //           tooltip: 'My Posts',
              //           child: const Center(child: Text("My Posts"))),
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
