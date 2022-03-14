import 'dart:convert';

import 'package:client/models/forum_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ForumItemProvider extends ChangeNotifier {
  late ForumItem forumItem;
  late String id;
  late String question;
  late String description;

  void setForumId(String id) {
    this.id = id;
  }

  String getForumId() {
    return this.id;
  }

  void setForumQuestion(String question) {
    this.question = question;
  }

  String getForumQuestion() {
    return this.question;
  }

  void setForumDescription(String description) {
    this.description = description;
  }

  String getForumDescription() {
    return this.description;
  }

  void postForumItem(BuildContext context) async {
    print('question $question description $description');
    final response = await http.post(Uri.parse('http://localhost:5000/forum'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'question': question,
          'description': description,
        }));

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Question Posted to Forum',
      );
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Posting Question',
      );
    }
  }
}
