import 'dart:convert';

import 'package:client/models/diary_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class DiaryItemProvider extends ChangeNotifier {
  late DiaryItem diaryItem;
  late String id;
  late String title;
  late String description;
  late String image;

  List<DiaryItem> posts = [];

  void setDiaryId(String id) {
    this.id = id;
  }

  String getDiaryId() {
    return this.id;
  }

  void setDiaryDescription(String description) {
    this.description = description;
  }

  String getDiaryDescription() {
    return this.description;
  }

  void setDiaryTittle(String tittle) {
    this.title = tittle;
  }

  String getDiaryTittle() {
    return this.title;
  }

  void postDiaryItem(BuildContext context) async {
    print('title $title description $description');
    final response = await http.post(
        Uri.parse('https://ctse-flowerapp.herokuapp.com/diary'),//edit link
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'title': title,
          'description': description,
        }));

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Your blog has Created on $title',
      );
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'An Error Occured Please Re-Submit your Blog',
      );
    }
  }

  void deleteDiary(String id) async {
    final response = await http
        .delete(Uri.parse('https://ctse-flowerapp.herokuapp.com/diary/$id'));//edit link

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Your Diary Deleted',
      );
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Deleting diary',
      );
    }
  }

  Future<List<DiaryItem>> getAllDiaryPosts() async {
    posts.clear();

    final response =
    await http.get(Uri.parse('https://ctse-flowerapp.herokuapp.com/diary')); //edit link

    if (response.statusCode == 200) {
      notifyListeners();

      final data = jsonDecode(response.body) as List;
      print("response $data");

      for (Map<String, dynamic> item in data) {
        var post = DiaryItem.fromJson(item);
        posts.add(post);
      }
      return posts;
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'An Error ocured',
      );

      return posts;
    }
  }

  Future<List<DiaryItem>> getUserDiaryPosts(String id) async {
    posts.clear();

    final response = await http.get(
        Uri.parse('https://ctse-flowerapp.herokuapp.com/diary/$id'));//edit link

    if (response.statusCode == 200) {
      notifyListeners();

      final data = jsonDecode(response.body) as List;
      print("response $data");

      for (Map<String, dynamic> item in data) {
        var post = DiaryItem.fromJson(item);
        posts.add(post);
      }
      return posts;
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Getting your diaries',
      );

      return posts;
    }
  }

  void updateDiary(String id, String title, String description) async {
    final response = await http.put(
        Uri.parse('https://ctse-flowerapp.herokuapp.com/diary/$id'), //edit
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'title': title,
          'description': description,
        }));

    if (response.statusCode == 200) {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Diary Updated',
      );
    } else {
      notifyListeners();
      Fluttertoast.showToast(
        msg: 'Problem with Updating Diary',
      );
    }
  }
}
