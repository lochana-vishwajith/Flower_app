import 'package:client/models/forum_items.dart';
import 'package:flutter/material.dart';

import '../screens/forum/viewQuestion.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({Key? key, this.model}) : super(key: key);

  final ForumItem? model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        print("id ${model!.id}"),
        Navigator.of(context).pushNamed(ViewQuestions.routeName,
            arguments: ForumItem(
                id: model!.id,
                question: model!.question,
                description: model!.description))
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(model!.question),
            )
          ],
        ),
      ),
    );
  }
}
