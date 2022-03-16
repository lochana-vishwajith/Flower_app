import 'package:client/Providers/forum_Item_provider..dart';
import 'package:client/screens/forum/update_forum-question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/forum_items.dart';

class MyPostCardComponent extends StatelessWidget {
  const MyPostCardComponent({Key? key, this.model}) : super(key: key);

  final ForumItem? model;

  @override
  Widget build(BuildContext context) {
    final forumProvider = context.read<ForumItemProvider>();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(model!.question),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            child: const Icon(Icons.edit),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(UpdateForum.routeName,
                                      arguments: ForumItem(
                                        id: model!.id,
                                        question: model!.question,
                                        description: model!.description,
                                      ));
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: GestureDetector(
                            child: const Icon(Icons.delete_forever_outlined),
                            onTap: () {
                              print("delete id ${model!.id}");
                              forumProvider.deletePost(model!.id);
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
