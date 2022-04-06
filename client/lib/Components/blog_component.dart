import 'package:client/models/diary_model.dart';
import 'package:flutter/material.dart';
import '../screens/diary/diary_Item.dart';

class BlogComponent extends StatelessWidget {
  const BlogComponent({Key? key, this.model}) : super(key: key);

  final DiaryItem? model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).pushNamed(ViewDiary.routeName,
            arguments: DiaryItem(
                id: model!.id,
                title: model!.title,
                date: model!.date,
                keyword: model!.keyword,
                description: model!.description))
      },
      child: Card(
        color: Colors.lightGreenAccent.shade100,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,

            children: [
            ListTile(

              title: Text(model!.title,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold)),
              subtitle: Text(model!.keyword.toUpperCase(),style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
              leading:const Icon(Icons.book,size: 50,color: Colors.green),
            )

          ],
        ),
      ),
    );
  }
}
