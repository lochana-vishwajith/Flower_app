import 'package:client/Providers/diary_item_provider.dart';
import 'package:client/screens/diary/diary_Update.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/diary_model.dart';

class MyBlogSlidesComponent extends StatelessWidget {
  const MyBlogSlidesComponent({Key? key, this.model}) : super(key: key);

  final DiaryItem? model;

  @override
  Widget build(BuildContext context) {
    final diaryProvider = context.read<DiaryItemProvider>();

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
                  title: Text(model!.title),
                ),
                ListBody(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(model!.description),
                    )
                  ],
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
                                  .pushNamed(UpdateDiary.routeName,
                                  arguments: DiaryItem(
                                    id: model!.id,
                                    title: model!.title,
                                    description: model!.description,
                                    keyword: model!.keyword,
                                    date:model!.date,
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
                              diaryProvider.deleteDiary(model!.id);
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
