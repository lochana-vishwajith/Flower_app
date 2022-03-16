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

  List<ForumItem> posts = [];

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
    final response = await http.post(
        Uri.parse('https://ctse-flowerapp.herokuapp.com/forum'),
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

  void deletePost(String id) async {
    final response = await http
        .delete(Uri.parse('https://ctse-flowerapp.herokuapp.com/forum/$id'));

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Post Deleted',
      );
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Deleting Posts',
      );
    }
  }

  Future<List<ForumItem>> getAllForumPosts() async {
    posts.clear();

    final response =
        await http.get(Uri.parse('https://ctse-flowerapp.herokuapp.com/forum'));

    if (response.statusCode == 200) {
      notifyListeners();

      final data = jsonDecode(response.body) as List;
      print("response $data");

      for (Map<String, dynamic> item in data) {
        var post = ForumItem.fromJson(item);
        posts.add(post);
      }
      return posts;
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Getting Posts',
      );

      return posts;
    }
  }

  Future<List<ForumItem>> getUserForumPosts(String id) async {
    posts.clear();

    final response = await http.get(
        Uri.parse('https://ctse-flowerapp.herokuapp.com/forum/userId/$id'));

    if (response.statusCode == 200) {
      notifyListeners();

      final data = jsonDecode(response.body) as List;
      print("response $data");

      for (Map<String, dynamic> item in data) {
        var post = ForumItem.fromJson(item);
        posts.add(post);
      }
      return posts;
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Getting Posts',
      );

      return posts;
    }
  }

  void updateForumPosts(String id, String question, String description) async {
    final response = await http.put(
        Uri.parse('https://ctse-flowerapp.herokuapp.com/forum/$id'),
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
        msg: 'Question Updated',
      );
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Updating Question',
      );
    }
  }
}
