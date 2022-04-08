import 'dart:async';

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
      color: Colors.lightGreenAccent.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(model!.title,style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                  subtitle: Text(model!.keyword,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                ),
                ListBody(
                  children: [
                    Padding(
                      padding:const EdgeInsets.all(8.0),
                      child: Text(model!.description,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.normal)),
                    )
                  ],
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(

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
                            child: const Icon(Icons.edit,color: Colors.blue,size: 40),

                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            child: const Icon(Icons.delete_forever_outlined,color: Colors.red,size: 40),
                            onTap: () {
                              diaryProvider.deleteDiary(model!.id);
                              Timer(const Duration(seconds:1), () {
                                Navigator.of(context)
                                    .pushNamed('/');
                              });
                            }
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


