import 'package:client/Components/card_component.dart';
import 'package:client/Providers/forum_Item_provider..dart';
import 'package:client/models/forum_items.dart';
import 'package:client/screens/forum/start_conversation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  late Future<List<ForumItem>> forumPosts;

  @override
  void initState() {
    super.initState();
    forumPosts = context.read<ForumItemProvider>().getAllForumPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: FutureBuilder<List<ForumItem>>(
          future: forumPosts,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("error");
              Fluttertoast.showToast(
                msg: 'Problem with Getting Posts',
              );
              return const Text("Problem with Getting Posts");
            }
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardComponent(title: snapshot.data![index].question);
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(StartConversation.routeName);
          },
          backgroundColor: const Color.fromARGB(255, 50, 59, 190),
          splashColor: const Color.fromARGB(255, 116, 114, 214),
          hoverColor: const Color.fromARGB(255, 6, 24, 58),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 12,
          tooltip: 'Start Coversation',
          child: const Icon(Icons.add)),
    );
  }
}
